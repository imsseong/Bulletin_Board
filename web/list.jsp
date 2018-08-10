<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-04
  Time: 오후 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css">
    <meta charset="UTF-8">
    <title>list</title>
</head>
<body>
<h1>게시판</h1>
<table class="table">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
<%
    request.setCharacterEncoding("UTF-8");

    Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
    String url = "jdbc:mysql://127.0.0.1:3306/bbc";
    String id = "root";
    String pwd = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(url, id, pwd); // db연결
        String sql = "SELECT * FROM board order by idx desc";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while(rs.next()) {
            int idx = rs.getInt("idx");
            String title = rs.getString("title");
            String writer = rs.getString("writer");
            String date = rs.getString("date");
            int views = rs.getInt("views");
%>
        <tr>
            <td><%=idx%></td>
            <td><a href="content.jsp?idx=<%=idx%>"><%=title%></a></td>
            <td><%=writer%></td>
            <td><%=date%></td>
            <td><%=views%></td>
        </tr>
<%
        }
        conn.close();
    } catch(Exception e) {
            out.println("DB problem");
            out.println(e.getMessage());
            e.printStackTrace();
        }
%>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>