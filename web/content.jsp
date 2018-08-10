<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-05
  Time: 오후 2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판-게시글조회</title>
</head>
<body>
<h1>게시글조회</h1>
    <%
        request.setCharacterEncoding("UTF-8");

        Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
        String url = "jdbc:mysql://127.0.0.1:3306/bbc";
        String id = "root";
        String pwd = "1234";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int idx = Integer.parseInt(request.getParameter("idx"));

        try {
            conn = DriverManager.getConnection(url, id, pwd); // db연결
            String sql = "SELECT * FROM board WHERE idx = " + idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String date = rs.getString("date");
                String content = rs.getString("content");
                int views = rs.getInt("views");
                views++;
    %>
<table>
    <tr>
        <th>제목</th>
        <td><%=title%></td>
    </tr>
    <tr>
        <th>번호</th>
        <td><%=idx%></td>
        <th>글쓴이</th>
        <td><%=writer%></td>
        <th>조회수</th>
        <td><%=views%></td>
        <th>날짜</th>
        <td><%=date%></td>
    </tr>
    <tr>
        <th>내용</th>
        <td><%=content%></td>
    </tr>
</table>
<%
    sql = "UPDATE board SET views=" + views + " where idx=" +idx;
    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();
%>
<a href="delete.jsp?idx=<%=idx%>">삭제</a>
<a href="update.jsp?idx=<%=idx%>">수정</a>
<a href="list.jsp">목록</a>
    <%
            }
            conn.close();
        } catch(Exception e) {
            out.println("DB problem");
            out.println(e.getMessage());
            e.printStackTrace();
        }
    %>
</body>
</html>