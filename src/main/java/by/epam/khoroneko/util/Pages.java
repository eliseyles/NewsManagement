package by.epam.khoroneko.util;

public enum Pages {
    EDIT("edit"),
    VIEW("view"),
    INDEX("index");

    private String value;

    Pages(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
