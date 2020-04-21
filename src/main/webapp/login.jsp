<%--
  Created by IntelliJ IDEA.
  User: brianpurnell
  Date: 4/21/20
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
        String user = request.getParameter("user");
        String pass - request.getParameter("pass");
    }
    if(user.equals("admin") && pass.equals("password")){
        response.sendRedirect("profile.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form name="loginForm" method="post" action="login.jsp">
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



</body>
</html>
