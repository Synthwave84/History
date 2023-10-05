<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>선언문 예제 - 메소드 선언</h2>
	id 변수: <%= id %>
	getId() 메서드 실행: <%= getId() %>
	
	<%!
	// 선언문: 멤버 필드 또는 메소드를 정의할 때 사용(클래스의 구성요소)
	String id = "doccomsa";

	public String getId() {
		return id;
	}%>
</body>
</html>