<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-05
  Time: 오전 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>insert board</title>
</head>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String date = formatter.format(new java.util.Date());
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://127.0.0.1:3306/bbc";
        String id = "root";
        String pwd = "12tjddla3";

        Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
        conn = DriverManager.getConnection(url, id, pwd); // db연결

        psmt = conn.prepareStatement();
        String sql = "INSERT INTO board" + "(idx, title, writer, date, content)" + "VALUES("
    } catch(Exception e) {
        e.printStackTrace();
        out.println("Fail");
    }

%>
<body>
</body>
</html>
