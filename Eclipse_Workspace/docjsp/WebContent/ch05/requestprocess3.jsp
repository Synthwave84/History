<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>request 예제 3</h2>
<%
// request 객체: 클라이언트에서 요청한 모든 정보를 가지고 있는 객체
// 클라이언트에서 method=post 방식으로 한글데이터 전송 시 깨짐
request.setCharacterEncoding("UTF-8"); // 해당 코드 작성해줘야 됨

// 하나의 파라미터명으로 여러 개의 값 전송 시 
// 선택된 체크박스 정보만 전송(체크되지 않은 정보는 전송되지 않음)
String[] hobby = request.getParameterValues("hobby"); // 네 줄이 아닌 한 줄만 작성

String result = "";
for (int i = 0; i < hobby.length; i++) {
	result += hobby[i] + ", ";
}
%>

항목 개수? <%= hobby.length %><br>
취미는? <%= result %><br>