package by.epam.khoroneko.builder;

import by.epam.khoroneko.entity.News;

import java.time.LocalDate;

public class NewsBuilder {
    private int id;
    private String title;
    private LocalDate date;
    private String brief;
    private String content;

    public NewsBuilder() {
    }

    public NewsBuilder(int id, String title, LocalDate date, String brief, String content) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.brief = brief;
        this.content = content;
    }

    public NewsBuilder setId(int id) {
        this.id = id;
        return this;
    }

    public NewsBuilder setTitle(String title) {
        this.title = title;
        return this;
    }

    public NewsBuilder setDate(LocalDate date) {
        this.date = date;
        return this;
    }

    public NewsBuilder setBrief(String brief) {
        this.brief = brief;
        return this;
    }

    public NewsBuilder setContent(String content) {
        this.content = content;
        return this;
    }

    public News getEntity() {
        return new News(id, title, date, brief, content);
    }
}
