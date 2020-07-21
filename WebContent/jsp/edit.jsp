<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
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
        <form>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>News Title</p>
                </div>
                <div class="col-75">
                    <input type="text" maxlength="100" name="#title" required>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>News Date</p>
                </div>
                <div class="col-75">
                    <input type="text" maxlength="10" name="#title" required>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>Brief</p>
                </div>
                <div class="col-75">
                   <textarea maxlength="500" required></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p>Content</p>
                </div>
                <div class="col-75">
                    <textarea maxlength="2048" required></textarea>
                </div>
            </div>
            <div class="row buttonGroup" style="margin-right: 50%">
                <button class="button" type="submit" name="#saveCommand" value="#commandName">Save</button>
                <button class="button" type="submit" name="#cancelCommand" value="#commandName">Cancel</button>
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
