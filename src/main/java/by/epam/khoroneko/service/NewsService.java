package by.epam.khoroneko.service;

import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.ServiceException;

import java.util.List;

public interface NewsService {
    void create(News news) throws ServiceException;

    void update(News news) throws ServiceException;

    void delete(List<News> newsList) throws ServiceException;

    News getById(News news) throws ServiceException;

    List<News> getAll() throws ServiceException;
}
