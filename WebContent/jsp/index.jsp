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
    <title>News List</title>
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
        <form>
            <c:if test="${empty newsList}">
                <h1>No news here yet</h1>
            </c:if>

            <c:forEach var="news" items="${newsList}">
                <div class="news">
                    <div class="row">
                        <div style="float: left">
                            <div class="column">
                                <p><b>${news.title}</b></p>
                            </div>
                            <div class="column" style="margin-left: 5px; max-width: 1000px">
                                <p>${news.brief}</p>
                            </div>
                        </div>
                        <div class="column" style="float: right">
                            <p class="dateFormat">${news.date}</p>
                        </div>
                    </div>
                    <div class="row newsContent">
                        <p>${news.content}</p>
                    </div>
                    <div class="row" style="float: right">
                        <div class="column">
                            <a href="${pageContext.request.contextPath}/view">view</a>
                            <a href="${pageContext.request.contextPath}/edit">edit</a>
                        </div>
                        <div class="column" style="margin-left: 5px">
                            <input type="checkbox" value="1" onclick="f()">
                        </div>
                    </div>
                </div>
            </c:forEach>


            <div class="buttonGroup">
                <button class="button" type="submit" id="deleteBtn" hidden>Delete</button>
            </div>
        </form>
    </div>
</div>
<div class="fixed-footer">
    <p>Copyright &copy EPAM 2020. All rights reserved</p>
</div>
<script src="${scriptJS}"></script>
</body>
</html>
