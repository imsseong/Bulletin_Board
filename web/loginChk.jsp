<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-09
  Time: 오후 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인체크</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

        // login.jsp에서 입력된 아이디와 비밀번호를 가져온다
        String userid = request.getParameter("userid");
        String pw = request.getParameter("password");

        // DB에서 아이디와 비밀번호 확인
        String url = "jdbc:mysql://127.0.0.1:3306/bbc";
        String id = "root";
        String pwd = "1234";

        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
            conn = DriverManager.getConnection(url, id, pwd); // db연결
            String sql = "SELECT password FROM users WHERE userid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPW = rs.getString("password");
                if (dbPW.equals(pw)) {
                    session.setAttribute("userid", userid);
                    session.setAttribute("login", "yes");
    %>
                    <script>
                        alert("로그인되었습니다.");
                        location.href = "main.jsp";
                    </script>
    <%
                } else {
    %>
                    <script>
                        alert("비밀번호를 확인해주세요.");
                        location.href = "login.jsp";
                    </script>
     <%
                }
            } else {
     %>
                <script>
                    alert("아이디를 확인해주세요.");
                    location.href = "login.jsp";
                </script>
    <%
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
