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
        <form action="${pageContext.request.contextPath}/save_news" method="post" id="edit-form">
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.title"/></p>
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
                    <p><fmt:message key="news.date" /></p>
                </div>
                <div class="col-75">
                    <input type="text" maxlength="10" name="date" required
                           value="<c:if test="${news!=null}">${news.date}</c:if><c:if test="${news==null}">${todayDate}</c:if>">
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.brief"/></p>
                </div>
                <div class="col-75">
                   <textarea maxlength="500" name="brief" required><c:if test="${news!=null}">${news.brief}</c:if></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-15 viewTitle">
                    <p><fmt:message key="news.content"/></p>
                </div>
                <div class="col-75">
                    <textarea maxlength="2048" name="content" required><c:if test="${news!=null}">${news.content}</c:if></textarea>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.getHeader("referer")}" method="get" id="cancel"></form>
        <div class="row buttonGroup" style="margin-right: 50%">
            <button form="edit-form" class="button" type="submit" name="command" value="save">
                <fmt:message key="edit.save" />
            </button>
            <button form="cancel" class="button" type="submit" name="id" value="${news.id}">
                <fmt:message key="edit.cancel"/>
            </button>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${scriptJS}"></script>
</body>
</html>
