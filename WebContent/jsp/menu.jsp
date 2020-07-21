<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<c:if test="${not empty sessionScope.language}">
    <fmt:setLocale value="${sessionScope.language}"/>
</c:if>
<fmt:setBundle basename="locale"/>

<ul class="menu">
    <li class="menuTitle"><p>
        <fmt:message key="menu.title"/>
    </p></li>
    <li class="menuItem"><a class="active" href="${pageContext.request.contextPath}/home">
        <fmt:message key="menu.list"/>
    </a></li>
    <li class="menuItem"><a href="${pageContext.request.contextPath}/add">
        <fmt:message key="menu.add"/>
    </a></li>
</ul>