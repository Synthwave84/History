<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>선언문 예제 - 메소드</h2>
	id변수 : <%=id %>
	getId()메소드 실행 : <%= getId() %>
	<%!
		// 선언문 : 멤버필드 또는 메소드를 정의할떄 사용한다
		// 클래스 구성요소.
		String id= "docomsa";
		public String getId() {
			return id;
		}
		
	%>
</body>
</html>