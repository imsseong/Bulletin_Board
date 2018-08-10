<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-10
  Time: 오전 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
</head>
<body>
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
    String writer = "";
    String login = (String)session.getAttribute("login");
    String userid = (String)session.getAttribute("userid");

    try {
        conn = DriverManager.getConnection(url, id, pwd); // db연결
        String sql = "SELECT * FROM board WHERE idx = " + idx;
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(login != null && login.equals("yes")){
            while(rs.next()) {
                String title = rs.getString("title");
                String date = rs.getString("date");
                String content = rs.getString("content");
                writer = rs.getString("writer");
                if(!writer.equals(userid)) {
%>
                    <script>
                        alert("글쓴이가 다릅니다.");
                        location.href = "list.jsp";
                    </script>
<%
                } else {
%>
                <form action="updateDB.jsp" method="post" onsubmit="return checkUpdate();">
                    제목<input type="text" name="title" value="<%=title%>" /><br/>
                    내용<textarea cols="30" rows="10" name="content"><%=content%></textarea><br/>
                    <input type="hidden" name="idx" value="<%=idx%>" /><br/>
                    <input type="submit" value="확인"/>
                </form>
                <script>
                    function checkUpdate() {
                        var length = document.forms[0].length - 1; // submit제외 모든 input태그 개수

                        if(document.forms[0].title.value == null || document.forms[0].title.value == "") {
                            alert("제목을 입력하세요.");
                            return false;
                        }
                        if(document.forms[0].content.value == null || document.forms[0].content.value == "") {
                            alert("내용을 입력하세요.");
                            return false;
                        }
                    }
                </script>
<%
                 }
            }
        } else {
%>
            <script>
                alert("로그인하세요");
                location.href=("login.jsp");
            </script>
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
