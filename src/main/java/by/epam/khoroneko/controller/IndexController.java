package by.epam.khoroneko.controller;

import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.ServiceException;
import by.epam.khoroneko.service.NewsServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {

    @RequestMapping("/index")
    public ModelAndView helloWorld() {
        List<News> entity = null;
        try {
            entity = new NewsServiceImpl().getAll();
        } catch (ServiceException ex) {

        }
        return new ModelAndView("index", "array", entity);
    }
}

