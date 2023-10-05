<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>request 예제 2</h2>
<%
// request 객체: 클라이언트에서 요청한 모든 정보를 가지고 있는 객체
// 클라이언트에서 method=post 방식으로 한글데이터 전송 시 깨짐
request.setCharacterEncoding("UTF-8"); // 해당 코드 추가해줘야 됨

String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String hobby = request.getParameter("hobby");
%>

<!-- 오라클 DB에 저장하는 코드가 들어감 -->

<%= name %> 님의 입력정보는<br>
나이: <%= age %><br>
성별: <%= gender %><br>
취미: <%= hobby %>