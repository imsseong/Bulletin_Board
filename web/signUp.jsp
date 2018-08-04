<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-04
  Time: 오후 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>signUp</title>
</head>
<body>
<h1>가입하기</h1>
<form action="insert.jsp" method="post">
    <table>
        <tr>
            <td>회원아이디</td>
            <td><input type="text" size=”10″ maxlength="16" name="id"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td>
                <input type="password" size=”10″ maxlength=”16″ name="password1">
                <input type="password" size=”10″ maxlength=”16″ name="password2">
            </td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" size=”10″ maxlength=”20″ name="username"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td>
                <input type="text" size=”6″ maxlength="45" name="email">
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" value="등록">
                <input type="reset" value="초기화">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
