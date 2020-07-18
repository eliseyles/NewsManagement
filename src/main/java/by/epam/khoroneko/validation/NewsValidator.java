package by.epam.khoroneko.validation;

import by.epam.khoroneko.entity.News;
import by.epam.khoroneko.exception.ValidationException;

import java.time.LocalDate;

public class NewsValidator {
    private static final String TITLE_REGEX = "^.* {0,100}";
    private static final String BRIEF_REGEX = "^.* {0,250}";
    private static final String CONTENT_REGEX = "^.* {0,300}";

    public void isValidNews(News news) throws ValidationException {
        isNotNull(news);
        isValidId(news);
        isValidTitle(news);
        isValidDate(news);
        isValidBrief(news);
        isValidContent(news);
    }

    public void isValidNewsData(News news) throws ValidationException {
        isNotNull(news);
        isValidTitle(news);
        isValidDate(news);
        isValidBrief(news);
        isValidContent(news);
    }

    public void isValidNewsId(News news) throws ValidationException {
        isNotNull(news);
        isValidId(news);
    }

    private void isNotNull(News news) throws ValidationException {
        if (news == null) {
            throw new ValidationException();
        }
    }

    private void isValidId(News news) throws ValidationException {
        if (news.getId() < 0) {
            throw new ValidationException("Invalid news id");
        }
    }

    private void isValidTitle(News news) throws ValidationException {
        if (!news.getTitle().matches(TITLE_REGEX)) {
            throw new ValidationException("Invalid news title");
        }
    }

    private void isValidDate(News news) throws ValidationException {
        if (news.getDate().compareTo(LocalDate.now()) > 0) {
            throw new ValidationException("Invalid news date");
        }
    }

    private void isValidBrief(News news) throws ValidationException {
        if (news.getBrief().matches(BRIEF_REGEX)) {
            throw new ValidationException("Invalid news brief");
        }
    }

    private void isValidContent(News news) throws ValidationException {
        if (news.getContent().matches(CONTENT_REGEX)) {
            throw new ValidationException("Invalid news content");
        }
    }
}
