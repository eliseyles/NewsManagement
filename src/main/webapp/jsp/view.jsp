<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>News View</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
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
            <li class="menuItem"><a class="active" href="#list">News List</a></li>
            <li class="menuItem"><a href="#add">Add News</a></li>
        </ul>
    </div>
    <div class="right">
        <div class="row">
            <div class="column viewTitle">
                <p>News Title</p>
            </div>
            <div class="column viewContent">
                <p>Title</p>
            </div>
        </div>
        <div class="row">
            <div class="column viewTitle">
                <p>News Date</p>
            </div>
            <div class="column viewContent dateFormat">
                <p>10/12/2020</p>
            </div>
        </div>
        <div class="row">
            <div class="column viewTitle">
                <p>Brief</p>
            </div>
            <div class="column viewContent">
                <p>Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                    Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                    Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                    Brief Brief Brief Brief Brief </p>
            </div>
        </div>
        <div class="row">
            <div class="column viewTitle">
                <p>Content</p>
            </div>
            <div class="column viewContent">
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
            <button class="button" type="button" name="#EditCommand" value="#commandName">Edit</button>
            <button class="button" type="button" name="#DeleteCommand" value="#commandName">Delete</button>
        </div>
    </div>
</div>
<div class="fixed-footer">
    <p>Copyright &copy EPAM 2020. All rights reserved</p>
</div>
<script src="../script/script.js"></script>
</body>
</html>
