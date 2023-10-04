<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>선언문 예제 - 변수선언</h2>
<!-- 클래스의 멤버필드 -->
	<%!
			// 선언문 : 클래스의 멤버필드 또는 메소드 선언만 작성가능.
			String str2 = "Docomsa";
	%>
<!-- 메소드의 지역변수 -->
	<%
			// 스크립트 릿 : _jspService()메소드 안에 코드가 삽입되어진다.
			String str1 = "회원 아이디 : " + str2;
	%>
	
	결과 : <%= str1%>
</body>
</html>