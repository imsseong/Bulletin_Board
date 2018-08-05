<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-04
  Time: 오후 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>main</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
    <h2>JSP Bulletin Board</h2>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="main.jsp">JSP 웹 게시판</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="main.jsp">HOME</a></li>
                <li><a href="list.jsp">BULLETIN BOARD</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                <li><a href="signUp.jsp"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
            </ul>
        </div>
    </nav>

</body>
</html>
