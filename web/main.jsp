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
    <title>main</title>
</head>
<body>
    <h2>JSP Bulletin Board</h2>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" data-target="#mynavbar" data-toggle="collapse" class="navbar-toggle">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">JSP 웹 게시판</a>
        </div>
        <div id="mynavbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">HOME</a></li>
                <li><a href="list.jsp">BULLETIN BOARD</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="login.jsp">Login</a></li>
                <li><a href="signUp.jsp">Sign Up</a></li>
            </ul>
        </div>
    </nav>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
