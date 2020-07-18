package by.epam.khoroneko.util;

public enum ExceptionValue {
    SERVER_ERROR("Internal error"),
    INVALID_NEWS_LIST("Invalid news list"),
    NULL_NEWS("News is null"),
    INVALID_NEWS_ID("Invalid news id"),
    INVALID_NEWS_TITLE("Invalid news title"),
    INVALID_NEWS_DATE("Invalid news date"),
    INVALID_NEWS_BRIEF("Invalid news brief"),
    INVALID_NEWS_CONTENT("Invalid news content");

    private String value;

    ExceptionValue(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
