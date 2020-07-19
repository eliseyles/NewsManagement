<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Spring MVC</title>
    <style type="text/css">
        body {
        }
    </style>
</head>
<body>
<br>
<div style="text-align: center">
    <h2>
        Hey You..!! This is your 1st Tutorial..<br> <br>
    </h2>
    <h3>
        получение
    </h3>
    <br/>
    <c:forEach var="entity" items="${array}">
        <h3>${entity}</h3>
    </c:forEach>
</div>
</body>
</html>