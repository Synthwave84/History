<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function servletPro() {
		location.href = "/Hello?userid=user01&passwd=1234";
	}
</script>
</head>
<body>
	<h3>서블릿을 사용하는 예제 : GET 방식</h3>
	<a href="/Hello?userid=user01&passwd=1234">서블릿요청1</a>
	<input type="button" value="서블릿요청2" onclick="servletPro()">
</body>
</html>