<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-07-30
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>signUp</title>
</head>
<body>
<h1>로그인</h1>
<form action="insert.jsp" method="post" onsubmit="checkSubmit()">
    <table>
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" size=”10″ maxlength="16" name="userid">
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td>
                <input type="password" size=”10″ maxlength=”20″ name="password">
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" value="로그인" />
                <input type="button" value="회원가입" onclick="goSignUp()" />
            </td>
        </tr>
    </table>
</form>

<script>
    function checkSubmit() {
        if(document.forms[0].userid.value == null || document.forms[0].userid.value == "") {
            alert("아이디를 입력하세요.");
            document.forms[0].userid.focus();
            return false;
        }
        if(document.forms[0].password.value == null || document.forms[0].password.value == "") {
            alert("비밀번호를 입력하세요.");
            document.forms[0].password.focus();
            return false;
        }
    }
    function goSignUp() {
        location.href="signUp.jsp";
    }
</script>
</body>
</html>
