<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-10
  Time: 오전 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>글삭제</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

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
        Class.forName("com.mysql.jdbc.Driver"); // jdbc드라이버 로딩
        conn = DriverManager.getConnection(url, id, pwd); // db연결
        String sql = "SELECT * FROM board WHERE idx = " + idx;
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(login != null && login.equals("yes")){
            while(rs.next()) {
                writer = rs.getString("writer");
                if(!writer.equals(userid)) {
%>
                    <script>
                        alert("글쓴이가 다릅니다.");
                        location.href = "list.jsp";
                    </script>
<%
                } else {

                     try {
                        String sql2 = "DELETE FROM board WHERE idx = " + idx;
                        out.println("ㅅㅂ");
                        pstmt = conn.prepareStatement(sql2);
                        pstmt.executeUpdate();
                        pstmt.close();
%>
                        <script>
                           alert("해당글을 삭제했습니다.");
                           location.href = "list.jsp";
                        </script>
<%
                     } catch (Exception e) {
                        e.printStackTrace();
                     } finally {
                         try {
                            if( pstmt != null ){
                                pstmt.close();
                            }
                            if( conn != null ){
                                conn.close();
                            }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                     }
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
