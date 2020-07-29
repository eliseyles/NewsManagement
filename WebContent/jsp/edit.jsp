<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<html>
<head>
    <spring:url value="/css/style.css" var="styleCSS" />
    <spring:url value="/script/script.js" var="scriptJS" />
    <link href="${styleCSS}" rel="stylesheet" />
    <title>News Edit</title>
</head>
<body>
<div class="fixed-header">
    <ul class="nav">
        <li class="navTitle"><p>News management</p></li>
        <li><a class="navLink" style="float:right" href="#eng">English</a></li>
        <li><a class="navLink" style="float:right" href="#rus">Russian</a></li>
    </ul>
</div>
<div class="container">
    <div class="left">
        <ul class="menu">
            <li class="menuTitle"><p>News</p></li>
            <li class="menuItem"><a class="active" href="${pageContext.request.contextPath}/home">News List</a></li>
            <li class="menuItem"><a href="${pageContext.request.contextPath}/add">Add News</a></li>
        </ul>
    </div>
    <div class="right">
        <form action="${pageContext.request.contextPath}/save_news" method="post" id="edit-form">
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>News Title</p>
                </div>
                <div class="col-75">
                    <input type="hidden" maxlength="100" name="id" required
                           value="<c:if test="${news!=null}">${news.id}</c:if><c:if test="${news==null}">0</c:if>">
                    <input type="text" maxlength="100" name="title" required
                           value="<c:if test="${news!=null}">${news.title}</c:if>">
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>News Date</p>
                </div>
                <div class="col-75">
                    <input type="text" maxlength="10" name="date" required
                           value="<c:if test="${news!=null}">${news.date}</c:if><c:if test="${news==null}">${todayDate}</c:if>">
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>Brief</p>
                </div>
                <div class="col-75">
                   <textarea maxlength="500" name="brief" required><c:if test="${news!=null}">${news.brief}</c:if></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>Content</p>
                </div>
                <div class="col-75">
                    <textarea maxlength="2048" name="content" required><c:if test="${news!=null}">${news.content}</c:if></textarea>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.getHeader("referer")}" method="get" id="cancel"></form>
        <div class="row buttonGroup" style="margin-right: 50%">
            <button form="edit-form" class="button" type="submit" name="command" value="save">Save</button>
            <button form="cancel" class="button" type="submit" name="id" value="${news.id}">Cancel</button>
        </div>
    </div>
</div>
<div class="fixed-footer">
    <p>Copyright &copy EPAM 2020. All rights reserved</p>
</div>
<script src="${scriptJS}"></script>
</body>
</html>
