package by.epam.khoroneko.controller;

import by.epam.khoroneko.builder.NewsBuilder;
import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.ServiceException;
import by.epam.khoroneko.service.NewsService;
import by.epam.khoroneko.service.NewsServiceImpl;
import by.epam.khoroneko.util.Attribute;
import by.epam.khoroneko.util.Pages;
import org.apache.log4j.Logger;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {
    private NewsService newsService = new NewsServiceImpl();
    private Logger logger = Logger.getLogger(IndexController.class);
    private static final String REDIRECT_TO_HOMEPAGE = "redirect:home";

    @RequestMapping("/index")
    public ModelAndView indexPage() {
        List<News> entity = null;
        try {
            entity = newsService.getAll();
        } catch (ServiceException ex) {
            logger.error(ex);
        }
        return new ModelAndView(Pages.INDEX.getValue(), Attribute.NEWS_LIST.getValue(), entity);
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homeForward() {
        return "forward:" + Pages.INDEX.getValue();
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPage() {
        return new ModelAndView(Pages.EDIT.getValue(), Attribute.TODAY_DATE.getValue(), LocalDate.now());
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView editPage(@RequestParam int id) {
        News news = null;
        try {
            news = newsService.getById(new NewsBuilder().setId(id).getEntity());
        } catch (ServiceException ex) {
            logger.error(ex);
        }
        return new ModelAndView(Pages.EDIT.getValue(), Attribute.NEWS.getValue(), news);
    }

    @RequestMapping(value = "/save_news", method = RequestMethod.POST)
    public String newsAdding(@RequestParam int id,
                             @RequestParam String title,
                             @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
                             @RequestParam LocalDate date,
                             @RequestParam String brief,
                             @RequestParam String content,
                             @RequestParam String command,
                             HttpServletRequest request) {
        String response = REDIRECT_TO_HOMEPAGE;
        try {

            if (command.equals(Attribute.COMMAND_SAVE.getValue())) {
                if (id == 0) {
                    News news = new News(id, title, date, brief, content);
                    newsService.create(news);
                } else {
                    News news = new News(id, title, date, brief, content);
                    newsService.update(news);
                }
            } else {
                response = request.getRequestURL().toString();
            }
        } catch (ServiceException ex) {
            logger.error(ex);
        }
        return response;
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView viewPage(@RequestParam int id) {
        News news = null;
        try {
            news = newsService.getById(new NewsBuilder().setId(id).getEntity());
        } catch (ServiceException ex) {
            logger.error(ex);
        }
        return new ModelAndView(Pages.VIEW.getValue(), Attribute.NEWS.getValue(), news);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ModelAndView deleteNews(@RequestParam int id) {
        try {
            List<News> delete = new ArrayList<>();
            delete.add(new NewsBuilder().setId(id).getEntity());
            newsService.delete(delete);
        } catch (ServiceException ex) {
            logger.error(ex);
        }
        return new ModelAndView(REDIRECT_TO_HOMEPAGE);
    }

    @RequestMapping(value = "/delete_checked", method = RequestMethod.POST)
    public String deleteCheckedNews(HttpServletRequest request) {
        try {
            String[] idList = request.getParameterValues(Attribute.ID.getValue());
            List<News> deletedNews = new ArrayList<>();
            for (String id : idList) {
                deletedNews.add(new NewsBuilder().setId(Integer.parseInt(id)).getEntity());
            }
            newsService.delete(deletedNews);
        } catch (ServiceException ex) {
            logger.error(ex);
        }
        return REDIRECT_TO_HOMEPAGE;
    }
}

