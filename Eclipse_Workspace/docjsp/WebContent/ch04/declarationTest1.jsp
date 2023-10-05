<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>선언문 예제 ─ 변수 선언</h2>
	<!-- 경로: C:\Dev\devtools\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\docjsp\org\apache\jsp\ch04 -->

	<!-- 선언문: 클래스의 멤버 필드 또는 메서드 선언만 작성 가능 -->
	<%!
		String str2 = "Doccomsa"; // 클래스의 멤버 필드
		// str1 = "홍길동"; // Error
	%>
	
	<!-- 스크립트 릿: _jspService() 메서드 안에 코드가 삽입되어진다. -->
	<%
		String str1 = "회원 아이디: " + str2; // 메소드의 지역변수
	%>
	
	<!-- 표현식: 스크립트 릿도 동일함 -->
	결과: <%= str1%>
</body>
</html>