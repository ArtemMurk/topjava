<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23.06.2019
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="ru.javawebinar.topjava.model.MealTo" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<jsp:useBean id="mealsWithExcess" scope="request" type="java.util.List<ru.javawebinar.topjava.model.MealTo>" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Hello meal</title>
</head>
<body>

<table border="1">

    <thead>
            <th>Description</th>
            <th>Data</th>
            <th>Calories</th>
    </thead>
    <tbody>
        <c:forEach items="${mealsWithExcess}" var="meal">
            <c:set var = "colorf" value = "green"/>

            <c:choose>
                <c:when test="${meal.excess==true}">
                    <c:set var="colorf" value="red"/>
                </c:when>
                <c:otherwise>
                    <c:set var="colorf" value="green"/>
                </c:otherwise>
            </c:choose>

            <tr style="color: ${colorf}">
                <td>${meal.description}</td>
                <td><javatime:format value="${meal.dateTime}" pattern="yyyy-MM-dd hh:mm" /></td>
                <td>${meal.calories}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
