<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userid = request.getParameter("userid");
String passwd = request.getParameter("passwd");

if(userid.equals("user01") && passwd.equals("1234")) {
	// 첫 접속 시 발급한 세션 ID로 아래 정보를 서버측의 메모리에 저장 및 관리한다.
	session.setAttribute("loginStatus", userid); // 추가
	// session.removeAttribute("loginStatus"); // 제거
	
	// main.jsp 주소가 헤더에 포함되어 브라우저로 보내지고, 다시 재요청이 발생된다. 
	response.sendRedirect("/main.jsp");
} else {
	out.println("<script>");
	out.println("alert('로그인 정보를 확인하세요.');");
	out.println("history.back()");
	out.println("</script>");
}
%>