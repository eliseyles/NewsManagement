package by.epam.khoroneko.util;

public enum Attribute {
    ID("id"),
    TITLE("title"),
    DATE("date"),
    BRIEF("brief"),
    CONTENT("content"),
    COMMAND_SAVE("save"),
    LANGUAGE("language"),
    NEWS_LIST("newsList"),
    TODAY_DATE("todayDate"),
    NEWS("news");

    private String value;

    Attribute(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
