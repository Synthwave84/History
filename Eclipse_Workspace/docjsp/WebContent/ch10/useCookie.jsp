<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				out.println("쿠키이름 : " + cookies[i].getName());
				out.println("쿠키값 : " + cookies[i].getValue());
			}
		}
	}
%>