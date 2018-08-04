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
    <title>write</title>
</head>
<body>
    <form action="insertBoard.jsp" method="post" onsubmit="return checkSubmit();">
        title <input type="text" name="title" /><br/>
        writer <input type="text" name="writer" /><br/>
        content <textarea cols="30" rows="10" name="content"></textarea><br/>
        <input type="submit" value="확인"/>
    </form>
    <script>
        function checkSubmit() {
            var length = document.forms[0].length - 1; // submit제외 모든 input태그 개수
            for(var i = 0; i < length; i++) {
                if(document.forms[0][i].value==null || document.forms[0][i].value=="") {
                    alert(document.forms[0][i].name + "을 입력해 주세요."); // 경고창
                    document.forms[0][i].focus();
                    return false;
                }
            } // for
        }
    </script>


</body>
</html>
