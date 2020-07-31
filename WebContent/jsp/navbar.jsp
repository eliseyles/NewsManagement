<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<c:if test="${not empty sessionScope.language}">
    <fmt:setLocale value="${sessionScope.language}"/>
</c:if>
<fmt:setBundle basename="locale"/>

<ul class="nav">
    <li class="navTitle"><p><fmt:message key="nav.title"/></p></li>
    <form>
        <li>
            <button type="submit" class="navLink" style="float:right" name="language" value="en">English</button>
        </li>
        <li>
            <button type="submit" class="navLink" style="float:right" name="language" value="ru">Русский</button>
        </li>
    </form>
</ul>
