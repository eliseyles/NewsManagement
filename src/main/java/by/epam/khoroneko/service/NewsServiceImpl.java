package by.epam.khoroneko.service;

import by.epam.khoroneko.dao.NewsDAO;
import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.DAOException;
import by.epam.khoroneko.exception.ServiceException;
import by.epam.khoroneko.exception.ValidationException;
import by.epam.khoroneko.factory.DAOFactory;
import by.epam.khoroneko.validation.NewsValidator;
import org.apache.log4j.Logger;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    private Logger logger = Logger.getLogger(NewsServiceImpl.class);
    private NewsDAO newsDAO = DAOFactory.INSTANCE.getNewsDAO();
    private NewsValidator validator = new NewsValidator();

    @Override
    public void create(News news) throws ServiceException {
        try {
            validator.isValidNewsData(news);
            newsDAO.create(news);
        } catch (DAOException | ValidationException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public void update(News news) throws ServiceException {
        try {
            validator.isValidNews(news);
            newsDAO.update(news);
        } catch (DAOException | ValidationException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public void delete(List<News> newsList) throws ServiceException {
        try {
            if (newsList != null) {
                for (News news : newsList) {
                    validator.isValidNewsId(news);
                }
                newsDAO.delete(newsList);
            } else {
                throw new ServiceException("Invalid newslist");
            }
        } catch (DAOException | ValidationException ex) {
            logger.error(ex);
            throw new ServiceException(ex);
        }
    }

    @Override
    public News getById(News news) throws ServiceException {
        try {
            validator.isValidNewsId(news);
            return newsDAO.getById(news);
        } catch (DAOException | ValidationException ex) {
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
