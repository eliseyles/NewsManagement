package by.epam.khoroneko.controller;

import by.epam.khoroneko.builder.NewsBuilder;
import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.ServiceException;
import by.epam.khoroneko.service.NewsService;
import by.epam.khoroneko.service.NewsServiceImpl;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class IndexController {
    private NewsService newsService = new NewsServiceImpl();

    @RequestMapping("/index")
    public ModelAndView helloWorld() {
        List<News> entity = null;
        try {
            entity = newsService.getAll();
        } catch (ServiceException ex) {

        }
        return new ModelAndView("index", "newsList", entity);
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homeForward() {

        return new String("forward:index");
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView finalPage() {
        return new ModelAndView("edit", "todayDate", LocalDate.now());
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam("id") int id) {
        News news = null;
        try {
            news = newsService.getById(new NewsBuilder().setId(id).getEntity());
        } catch (ServiceException ex) {

        }
        return new ModelAndView("edit", "news", news);
    }

    @RequestMapping(value = "/save_news", method = RequestMethod.POST)
    public String newsAdding(@RequestParam("id") int id,
                             @RequestParam("title") String title,
                             @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
                             @RequestParam("date") LocalDate date,
                             @RequestParam("brief") String brief,
                             @RequestParam("content") String content,
                             @RequestParam("command") String command, HttpServletRequest request) {
        String response = "redirect:index";
        try {

            if (command.equals("save")) {
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

        }
        return response;
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView view(@RequestParam("id") int id) {
        News news = null;
        try {
            news = newsService.getById(new NewsBuilder().setId(id).getEntity());
        } catch (ServiceException ex) {

        }
        return new ModelAndView("view", "news", news);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ModelAndView delete(@RequestParam("id") int id) {
        try {
            List<News> delete = new ArrayList<>();
            delete.add(new NewsBuilder().setId(id).getEntity());
            newsService.delete(delete);
        } catch (ServiceException ex) {

        }
        return new ModelAndView("redirect:index");
    }

    @RequestMapping(value = "/delete_checked", method = RequestMethod.POST)
    public String deleteChecked(HttpServletRequest request) {
        try {
            String[] idList = request.getParameterValues("id");
            List<News> deletedNews = new ArrayList<>();
            for (String id : idList) {
                deletedNews.add(new NewsBuilder().setId(Integer.parseInt(id)).getEntity());
            }
            newsService.delete(deletedNews);
        } catch (ServiceException ex) {

        }
        return "redirect:home";
    }
}

