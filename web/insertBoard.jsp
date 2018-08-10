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
    <meta charset="UTF-8">
    <title>insert board</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
    String url = "jdbc:mysql://127.0.0.1:3306/bbc";
    String id = "root";
    String pwd = "1234";

    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd hh:ss");

    String writer = "";
    String login = (String)session.getAttribute("login");
    if(login != null && login.equals("yes")){
        writer = (String)session.getAttribute("userid");
    }
    if(writer == null){
%>
        <script>
            alert("로그인하세요.");
            location.href = "login.jsp";
        </script>
<%
    } else {

        String title = request.getParameter("title");
        String date = formatter.format(new java.util.Date());
        String content = request.getParameter("content");
        writer = (String)session.getAttribute("userid");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(url, id, pwd); // db연결
            String sql = "INSERT INTO board (title, writer, date, content) VALUES(?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, title);
            pstmt.setString(2, writer);
            pstmt.setString(3, date);
            pstmt.setString(4, content);

            pstmt.execute();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<script>
    alert("게시글이 등록 되었습니다.");
    location.href = "list.jsp";
</script>
</body>
</html>
