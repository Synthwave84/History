<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>
<%
	Date nowDate = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	String formatDate = dateFormat.format(nowDate); // 2023년 10월 4일
%>
<p>현재 날짜는 <%= formatDate%>입니다.</p>
</body>
</html>