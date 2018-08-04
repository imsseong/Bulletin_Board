<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-04
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    String url = "jdbc:mysql://127.0.0.1:3306/bbc";
    String id = "root";
    String pwd = "1234";

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, id, pwd);
} catch(Exception e) {
    e.printStackTrace();
    out.println("Fail");
}
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>insert</title>
</head>
<body>

</body>
</html>
