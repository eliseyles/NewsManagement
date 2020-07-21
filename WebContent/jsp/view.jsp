<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<c:if test="${not empty sessionScope.language}">
    <fmt:setLocale value="${sessionScope.language}"/>
</c:if>
<fmt:setBundle basename="locale"/>
<html>
<head>
    <spring:url value="/css/style.css" var="styleCSS"/>
    <spring:url value="/script/script.js" var="scriptJS"/>
    <link href="${styleCSS}" rel="stylesheet"/>
    <title><fmt:message key="view.title"/></title>
</head>
<body>
<div class="fixed-header">
    <jsp:include page="navbar.jsp"/>
</div>
<div class="container">
    <div class="left">
        <jsp:include page="menu.jsp"/>
    </div>
    <div class="right">
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.title"/></p>
            </div>
            <div class="col-75 viewContent">
                <p>Title</p>
            </div>
        </div>
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.date"/></p>
            </div>
            <div class="col-75 viewContent dateFormat">
                <p>10/12/2020</p>
            </div>
        </div>
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.brief"/></p>
            </div>
            <div class="col-75 viewContent">
                <p>Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                    Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                    Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                    Brief Brief Brief Brief Brief </p>
            </div>
        </div>
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.content"/></p>
            </div>
            <div class="col-75 viewContent">
                <p>
                    Some news Some newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome
                    newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome
                    newsSome
                    Some newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome
                    news
                    Some newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome
                    news
                    Some newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome
                    news
                    Some newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome newsSome news news
                </p>
            </div>
        </div>
        <div class="row buttonGroup">
            <button class="button" type="button" name="#EditCommand" value="#commandName">
                <fmt:message key="view.edit"/>
            </button>
            <button class="button" type="button" name="#DeleteCommand" value="#commandName">
                <fmt:message key="view.delete"/>
            </button>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${scriptJS}"></script>
</body>
</html>
