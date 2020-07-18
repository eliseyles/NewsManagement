package by.epam.khoroneko.dao;

import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.DAOException;

import java.util.List;

public interface NewsDAO {
    void create(News news) throws DAOException;

    void update(News news) throws DAOException;

    void delete(List<News> newsList) throws DAOException;

    News getById(News news) throws DAOException;

    List<News> getAll() throws DAOException;
}
