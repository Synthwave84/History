<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="./join">
		<input type="text" name="userID"><br>
		<input type="password" name="passwd"><br>
		<input type="text" name="addr"><br>
		<input type="text" name="age"><br>
		<input type="submit" value="전송">
	</form>
	<a href="./join?userID=a&passwd=123&addr=123&age=123">겟이야!</a>
</body>
</html>