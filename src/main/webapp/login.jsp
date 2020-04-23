<<<<<<< HEAD
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("admin") && password.equals("password")) {
            response.sendRedirect("/profile");
        }
    }
%>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1>
        <form action="/login.jsp" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
=======
<%--
  Created by IntelliJ IDEA.
  User: brianpurnell
  Date: 4/21/20
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${param.user == 'admin' && param.pass == 'password}'}">
        <c:redirect url="./profile.jsp">
            <c:param name="user" value="${param.user}"></c:param>
            <c:param name="pass" value="${param.pass}"></c:param>
        </c:redirect>

    </c:when>
</c:choose>

<html>
<head>
    <title>Title</title>
</head>
<body>

<form name="loginForm" method="post" action="./login.jsp">
    <table width="20%" bgcolor="0099CC" align="center">
        <tr>
            <td colspan=2><b>Login</b></td>
        </tr>
        <tr>
            <td>Username:</td>
            <td><input type="text" size=25 name="user"></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="Password" size=25 name="pass"></td>
        </tr>
        <tr>
            <td ><input type="Reset"></td>
            <td><input type="submit" onclick="return check(this.form)" value="Login"></td>
        </tr>

    </table>
</form>



>>>>>>> 32b54d5adf7d73663b05476d0a448594b21664dc
</body>
</html>
