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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>insert</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
    String url = "jdbc:mysql://127.0.0.1:3306/bbc";
    String id = "root";
    String pwd = "1234";

    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");

    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String username = request.getParameter("username");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email") + "@" + request.getParameter("email2");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection(url, id, pwd); // db연결
        String sql = "INSERT INTO users (userid, password, username, gender, email) VALUES(?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, userid);
        pstmt.setString(2, password);
        pstmt.setString(3, username);
        pstmt.setString(4, gender);
        pstmt.setString(5, email);

        pstmt.execute();
        pstmt.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<script>
    alert("회원가입되었습니다");
    location.href = "main.jsp";
</script>
</body>
</html>
