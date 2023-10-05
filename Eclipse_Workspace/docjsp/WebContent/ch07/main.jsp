<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<!-- include 디렉티브 -->
	<!-- <%@include file = "comm/top.jsp" %> -->
	
	<jsp:include page="comm/top.jsp" /> <!-- include 액션태그 -->
</div>
<hr />
<div>
	<p>DocMall 사이트는 의류 쇼핑몰 사이트입니다.</p>
</div>
<hr />
<div>
	<!-- <%@include file = "comm/bottom.jsp" %> -->
	<jsp:include page="comm/bottom.jsp" />
</div>
</body>
</html>