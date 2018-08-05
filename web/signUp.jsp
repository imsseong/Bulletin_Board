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
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>signUp</title>
</head>
<body>
<h1>회원가입</h1>
<form action="insert.jsp" method="post" onsubmit="checkSubmit()">
    <table>
        <tr>
            <td class="subject">아이디</td>
            <td>
                <input type="text" size=”10″ maxlength="16" name="userid">
                <input type="button" value="중복확인">
            </td>
        </tr>
        <tr>
            <td class="subject">비밀번호</td>
            <td>
                <input type="password" size=”10″ maxlength=”20″ name="password">
            </td>
        </tr>
        <tr>
            <td class="subject">비밀번호확인</td>
            <td>
                <input type="password" size=”10″ maxlength=”20″ name="passwordchk">
            </td>
        </tr>
        <tr>
            <td class="subject">이름</td>
            <td><input type="text" size=”10″ maxlength=”20″ name="username"></td>
        </tr>
        <tr>
            <td class="subject">성별</td>
            <td>
                <input type="radio" name="gender" value="남" checked>남
                <input type="radio" name="gender" value="여" checked>여
            </td>
        </tr>
        <tr>
            <td class="subject">이메일</td>
            <td>
                <input type="text" size=”6″ maxlength="45" name="email">@
                <select name="email2">
                    <option>naver.com</option>
                    <option>gmail.com</option>
                    <option>daum.com</option>
                </select>
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

<script>
    function checkSubmit() {
        if(document.forms[0].userid.value == null || document.forms[0].userid.value == "") {
            alert("아이디를 입력하세요.");
            return false;
        }
        if(document.forms[0].password.value == null || document.forms[0].password.value == "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if(document.forms[0].password.value != document.forms[0].passwordchk.value) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
    }
</script>
</body>
</html>
