<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Servlet을 사용하기 위한 예제. post방식</h3>
<form method="post" action="/Hello">
	 아이디 : <input type="text" name="userid"><br>
	 비번 : <input type="password" name="passwd"><br>
	 <input type="submit" value="로그인">
</form>
</body>
</html>