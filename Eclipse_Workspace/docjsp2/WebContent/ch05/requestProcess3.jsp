<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>request 예제</h2>



<% 
//	JSP request 객체 : 클라이언트에서 요청한 모든 정보를 가지고 있는 객체.
//	클라이언트에서 method="post"방식으로 한글데이터 전송 시, 폰트가 깨진다.
//	setCharacterEncoding 객체를 통해 한글 인코딩을 바꾸어 주어야한다
request.setCharacterEncoding("UTF-8");
// 	하나의 파라미터명으로 여러개의 값을 전송시
//	선택된 체크박스 정보만 전송한다.
String [] hobby = request.getParameterValues("hobby");
String result = ""; 

for (int i=0; i<hobby.; i++) {
	result += hobby[i] + ",";
}
%>

항목 개수<%=hobby.length %> <br>
취미는 ? <%=result %>