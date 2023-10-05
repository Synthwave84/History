<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String userid = request.getParameter("userid");
String passwd = request.getParameter("passwd");

//	첫 접속시 발급한 세션ID로 아래 정보를 서버측의 메모리에 저장 및 관리한다.
if(userid.equals("user01") && passwd.equals("1234")) {
//	세션 소멸 시간.
	
	session.setAttribute("loginStatus", userid);
//	session.reomveAttribute("liginStatus"); 제거
//	main.jsp 주소가 헤더에 포함되어, 브라우저로 보내지고, 다시 재요청이 일어난다
	response.sendRedirect("/main.jsp");
}else {
	// out.println = 서버에서 작성된 내용을 전달한다.
	out.println("<script>");
	out.println("alert('로그인 정보를 확인하세요');");
	out.println("history.back();");
	out.println("</script>");
}

%>
