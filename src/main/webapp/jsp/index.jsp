<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>News List</title>
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
        <form>
            <div class="news">
                <div class="row">
                    <div style="float: left">
                        <div class="column">
                            <p><b>News Title</b></p>
                        </div>
                        <div class="column" style="margin-left: 5px; max-width: 1000px">
                            <p>Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                                Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                                Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief Brief
                                Brief Brief Brief Brief Brief </p>
                        </div>
                    </div>
                    <div class="column" style="float: right">
                        <p class="dateFormat">10/12/2020</p>
                    </div>
                </div>
                <div class="row newsContent">
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
                <div class="row" style="float: right">
                    <div class="column">
                        <a href="#view">view</a>
                        <a href="#edit">edit</a>
                    </div>
                    <div class="column" style="margin-left: 5px">
                        <input type="checkbox" value="1" onclick="f()">
                    </div>
                </div>
            </div>
            <div class="news">
                <div class="row">
                    <div class="column">
                        <p><b>News Title</b></p>
                    </div>
                    <div class="column" style="float: right">
                        <p class="dateFormat">10/12/2020</p>
                    </div>
                </div>
                <div class="row newsContent">
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
                <div class="row" style="float: right">
                    <div class="column">
                        <a href="#view">view</a>
                        <a href="#edit">edit</a>
                    </div>
                    <div class="column" style="margin-left: 5px">
                        <input type="checkbox" value="1" onclick="f()">
                    </div>
                </div>
            </div>
            <div class="buttonGroup">
                <button class="button" type="submit" id="deleteBtn" hidden>Delete</button>
            </div>
        </form>
    </div>
</div>
<div class="fixed-footer">
    <p>Copyright &copy EPAM 2020. All rights reserved</p>

</div>
<script src="../script/script.js"></script>
</body>
</html>