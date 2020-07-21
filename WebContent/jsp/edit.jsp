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
    <spring:url value="/script/script.js" var="scriptJS" />
    <spring:url value="/css/style.css" var="styleCSS" />
    <link href="${styleCSS}" rel="stylesheet" />
    <title><fmt:message key="edit.title"/></title>
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
        <form name="Form">
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.title"/></p>
                </div>
                <div class="col-75">
                    <input type="text" maxlength="100" name="#title" required>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.date" /></p>
                </div>
                <div class="col-75">
                    <input type="text" id="dateInput"  name="dateInput" maxlength="10" required>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.brief"/></p>
                </div>
                <div class="col-75">
                   <textarea maxlength="500" required></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.content"/></p>
                </div>
                <div class="col-75">
                    <textarea maxlength="2048" required></textarea>
                </div>
            </div>
            <div class="row buttonGroup" style="margin-right: 50%">
                <button class="button" type="submit" name="#saveCommand" value="#commandName">
                    <fmt:message key="edit.save" />
                </button>
                <button class="button" type="submit" name="#cancelCommand" value="#commandName">
                    <fmt:message key="edit.cancel"/>
                </button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${scriptJS}"></script>
</body>
</html>
