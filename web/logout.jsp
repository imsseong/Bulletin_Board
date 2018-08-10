<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-09
  Time: 오후 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그아웃</title>
</head>
<body>
    <%
        session.invalidate();
        response.sendRedirect("main.jsp");
    %>
</body>
</html>
