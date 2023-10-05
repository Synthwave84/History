<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>request 요청 정보</h3>
프로토콜 이름: <%= request.getProtocol() %><br />
서버 이름: <%= request.getServerName() %><br />
Method 방식: <%= request.getMethod() %><br />
컨텍스트 경로: <%= request.getContextPath() %><br />
URI:  <%= request.getRequestURI() %><br />
접속한 클라이언트 IP: <%= request.getRemoteAddr() %> 
</body>
</html>