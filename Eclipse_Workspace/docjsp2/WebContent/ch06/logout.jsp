<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// 	세션 강제소멸
	session.invalidate();

	response.sendRedirect("/main.jsp");
%>