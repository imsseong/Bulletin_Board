<%--
  Created by IntelliJ IDEA.
  User: seongim
  Date: 2018-08-04
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>write</title>
</head>
<body>
    <form action="insertBoard.jsp" method="post" onsubmit="return checkSubmit();">
        제목<input type="text" name="title" /><br/>
        내용<textarea cols="30" rows="10" name="content"></textarea><br/>
        <input type="submit" value="확인"/>
    </form>
    <script>
        function checkSubmit() {
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


</body>
</html>
