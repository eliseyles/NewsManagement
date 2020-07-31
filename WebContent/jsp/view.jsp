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
                <p>${news.title}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.date"/></p>
            </div>
            <div class="col-75 viewContent dateFormat">
                <p>${news.date}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.brief"/></p>
            </div>
            <div class="col-75 viewContent">
                <p>${news.brief}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-15 viewTitle">
                <p><fmt:message key="news.content"/></p>
            </div>
            <div class="col-75 viewContent">
                <p>${news.content}</p>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/edit" method="get" id="edit-form"></form>
        <form action="${pageContext.request.contextPath}/delete?id=${news.id}" method="post" id="delete-form"></form>
        <div class="row buttonGroup">
            <button form="edit-form" class="button" type="submit" name="id" value="${news.id}">
                <fmt:message key="view.edit"/>
            </button>
            <button form="delete-form" class="button" type="submit">
                <fmt:message key="view.delete"/>
            </button>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${scriptJS}"></script>
</body>
</html>
