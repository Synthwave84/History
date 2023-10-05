<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 세션 강제 소멸. 로그아웃 기능

	response.sendRedirect("/main.jsp");
%>