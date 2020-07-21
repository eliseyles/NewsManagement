<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<c:if test="${not empty sessionScope.language}">
    <fmt:setLocale value="${sessionScope.language}"/>
</c:if>
<fmt:setBundle basename="locale"/>
<html>
<head>
    <spring:url value="/css/style.css" var="styleCSS"/>
    <spring:url value="/script/script.js" var="scriptJS"/>
    <link href="${styleCSS}" rel="stylesheet"/>
    <title><fmt:message key="index.title"/></title>
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
        <form>
            <c:if test="${empty newsList}">
                <h1><fmt:message key="index.list.empty"/></h1>
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
                            <a href="${pageContext.request.contextPath}/view">
                                <fmt:message key="index.news.view"/>
                            </a>
                            <a href="#edit">
                                <fmt:message key="index.news.edit"/>
                            </a>
                        </div>
                        <div class="column" style="margin-left: 5px">
                            <input type="checkbox" value="1" onclick="f()">
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="buttonGroup">
                <button class="button" type="submit" id="deleteBtn" hidden>
                    <fmt:message key="index.delete"/>
                </button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${scriptJS}"></script>
</body>
</html>