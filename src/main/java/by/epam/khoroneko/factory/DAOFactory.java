package by.epam.khoroneko.factory;

import by.epam.khoroneko.dao.NewsDAO;
import by.epam.khoroneko.dao.NewsDAOImpl;

public enum DAOFactory {
    INSTANCE;

    private NewsDAO newsDAO = new NewsDAOImpl();

    public NewsDAO getNewsDAO() {
        return newsDAO;
    }
}
