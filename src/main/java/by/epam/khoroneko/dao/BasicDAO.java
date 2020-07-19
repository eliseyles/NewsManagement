package by.epam.khoroneko.dao;

import by.epam.khoroneko.pool.ProxyConnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BasicDAO {
    Logger logger = Logger.getLogger(BasicDAO.class);

    protected void rollbackTransaction(Connection connection) {
        if (connection != null) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                logger.error("Cannot rollback transaction", ex);
            }
        }
    }

    protected void closeResultSet(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                logger.error("Cannot close resultSet", ex);
            }
        }
    }

    protected void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException ex) {
                logger.error("Cannot close PreparedStatement", ex);
            }
        }
    }

    protected void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                ((ProxyConnection) connection).close();
            } catch (ClassCastException ex) {
                logger.error("Invalid connection", ex);
            }
        }
    }
}
