package by.epam.khoroneko.service;

import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.ServiceException;

import java.util.List;

public interface NewsService {
    void create(News news) throws ServiceException;

    void update(News news) throws ServiceException;

    void delete(News news) throws ServiceException;
//    todo передавать из контроллера по одному удаялемые элемент или пачкой

    News getById(News news) throws ServiceException;

    List<News> getAll() throws ServiceException;
}
