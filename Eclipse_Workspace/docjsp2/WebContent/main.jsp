<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(session.getAttribute("loginStatus") != null) {
%>
<%=session.getAttribute("loginStatus") %> 님 로그인 상태입니다.
<a href="/ch06/logout.jsp">로그아웃</a>
<%
} else {
%>
<a href="/ch06/loginForm.jsp">로그인</a>
<% 
}
%>