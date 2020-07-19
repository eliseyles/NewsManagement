package by.epam.khoroneko.dao;

import by.epam.khoroneko.builder.NewsBuilder;
import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.DAOException;
import by.epam.khoroneko.pool.ConnectionPool;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAOImpl extends BasicDAO implements NewsDAO {
    private Logger logger = Logger.getLogger(NewsDAOImpl.class);
    protected ConnectionPool connectionPool = ConnectionPool.INSTANCE;

    private static final String INSERT_NEWS =
            "INSERT INTO `news` (`title`, `date`, `brief`, `content`) VALUES (?, ?, ?, ?)";

    private static final String UPDATE_NEWS_BY_ID =
            "UPDATE `news` SET `title`=?, `date`=?, `brief`=?, `content`=? WHERE id=?";

    private static final String DELETE_NEWS_BY_ID = "DELETE FROM `news` WHERE `id` = ?";

    private static final String FIND_NEWS_BY_ID =
            "SELECT `id`, `title`, `date`, `brief`, `content` from `news` WHERE `id` = ?";

    private static final String FIND_ALL_NEWS =
            "SELECT `id`, `title`, `date`, `brief`, `content` from `news`";

    @Override
    public void create(News news) throws DAOException {
        try (Connection connection = connectionPool.getConnection();
             PreparedStatement statement = buildInsertStatement(connection, news)) {
            statement.executeUpdate();
        } catch (SQLException ex) {
            logger.error(ex);
            throw new DAOException("Error while adding element", ex);
        }
    }

    @Override
    public void update(News news) throws DAOException {
        try (Connection connection = connectionPool.getConnection();
             PreparedStatement statement = buildUpdateByIDStatement(connection, news)) {
            statement.executeUpdate();
        } catch (SQLException ex) {
            logger.error(ex);
            throw new DAOException("Error while updating element", ex);
        }
    }

    @Override
    public void delete(List<News> newsList) throws DAOException {
        Connection connection = connectionPool.getConnection();
        PreparedStatement statement = null;
        try {
            connection.setAutoCommit(false);
            connection.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
            for (News news : newsList) {
                statement = buildDeleteByIDStatement(connection, news);
                statement.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            rollbackTransaction(connection);
            logger.error(ex);
            throw new DAOException(ex);
        } finally {
            closeConnection(connection);
            closeStatement(statement);
        }
    }

    @Override
    public News getById(News news) throws DAOException {
        try (Connection connection = connectionPool.getConnection();
             PreparedStatement statement = buildFindByIdStatement(connection, news);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                return createEntityFromResultSet(resultSet);
            }
            return null;
        } catch (SQLException ex) {
            logger.error(ex);
            throw new DAOException("Error while getting element by id", ex);
        }
    }

    @Override
    public List<News> getAll() throws DAOException {
        try (Connection connection = connectionPool.getConnection();
             PreparedStatement statement = buildFindAllStatement(connection);
             ResultSet resultSet = statement.executeQuery()) {
            List<News> result = new ArrayList<>();
            while (resultSet.next()) {
                result.add(createEntityFromResultSet(resultSet));
            }
            return result;
        } catch (SQLException ex) {
            logger.error(ex);
            throw new DAOException("Error while getting all elements", ex);
        }
    }

    private PreparedStatement buildInsertStatement(Connection connection, News news) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEWS);
        int statementIndex = 0;
        preparedStatement.setString(++statementIndex, news.getTitle());
        preparedStatement.setDate(++statementIndex, Date.valueOf(news.getDate()));
        preparedStatement.setString(++statementIndex, news.getBrief());
        preparedStatement.setString(++statementIndex, news.getContent());
        return preparedStatement;
    }

    private PreparedStatement buildUpdateByIDStatement(Connection connection, News news) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_NEWS_BY_ID);
        int statementIndex = 0;
        preparedStatement.setString(++statementIndex, news.getTitle());
        preparedStatement.setDate(++statementIndex, Date.valueOf(news.getDate()));
        preparedStatement.setString(++statementIndex, news.getBrief());
        preparedStatement.setString(++statementIndex, news.getContent());
        preparedStatement.setInt(++statementIndex, news.getId());
        return preparedStatement;
    }

    private PreparedStatement buildDeleteByIDStatement(Connection connection, News news) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_NEWS_BY_ID);
        int statementIndex = 0;
        preparedStatement.setInt(++statementIndex, news.getId());
        return preparedStatement;
    }

    private PreparedStatement buildFindByIdStatement(Connection connection, News news) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(FIND_NEWS_BY_ID);
        int statementIndex = 0;
        preparedStatement.setInt(++statementIndex, news.getId());
        return preparedStatement;
    }

    private PreparedStatement buildFindAllStatement(Connection connection) throws SQLException {
        return connection.prepareStatement(FIND_ALL_NEWS);
    }

    protected News createEntityFromResultSet(ResultSet resultSet) throws SQLException{
        return new NewsBuilder().setId(resultSet.getInt("id"))
                .setTitle(resultSet.getString("title"))
                .setDate(resultSet.getDate("date").toLocalDate())
                .setBrief(resultSet.getString("brief"))
                .setContent(resultSet.getString("content"))
                .getEntity();
    }
}
