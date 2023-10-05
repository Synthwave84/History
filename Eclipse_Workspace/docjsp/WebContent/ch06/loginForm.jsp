<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.setMaxInactiveInterval(60); // 세션 소멸시간(60초)
%>
<h3>로그인</h3>
<form method="post" action="loginOk.jsp">
	아이디: <input type="text" name="userid" /><br />
	비밀번호: <input type="password" name = "passwd" /><br />
	<input type="submit" value="로그인" />
</form>
</body>
</html>