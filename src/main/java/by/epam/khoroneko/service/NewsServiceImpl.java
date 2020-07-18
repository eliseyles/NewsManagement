package by.epam.khoroneko.service;

import by.epam.khoroneko.dao.NewsDAO;
import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.DAOException;
import by.epam.khoroneko.exception.ServiceException;
import by.epam.khoroneko.factory.DAOFactory;
import org.apache.log4j.Logger;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    private Logger logger = Logger.getLogger(NewsServiceImpl.class);
    private NewsDAO newsDAO = DAOFactory.INSTANCE.getNewsDAO();

    @Override
    public void create(News news) throws ServiceException {
        try {
            newsDAO.create(news);
//            todo add validation
        } catch (DAOException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public void update(News news) throws ServiceException {
        try {
            newsDAO.update(news);
        } catch (DAOException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public void delete(News news) throws ServiceException {
        try {
            newsDAO.delete(news);
        } catch (DAOException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public News getById(News news) throws ServiceException {
        try {
            return newsDAO.getById(news);
        } catch (DAOException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public List<News> getAll() throws ServiceException {
        try {
            return newsDAO.getAll();
        } catch (DAOException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }
}
