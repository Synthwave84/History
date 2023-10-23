<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Get, Post방식을 테스트하는 예제</h3>
	<!-- 절대경로 -->
	<form method="post" action="/sample/basicPro">
		<input type="submit" value="POST요청">
		</form>
		<br>
		<!-- 상대경로. -->
		<a href="./basicPro">GET요청</a>
	</form>
</body>
</html>