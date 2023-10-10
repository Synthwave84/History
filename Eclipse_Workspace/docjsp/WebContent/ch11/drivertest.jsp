<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC 드라이버 테스트</h2>

<%
//	데이터베이스 연결 기능으로 사용하는 인터페이스
	Connection conn = null;
	try {
//	데이터베이스 연결정보. SQL Developer 접속정보
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId= "ORA_USER";
	String dbPw= "12345";
//	1) DriverManager 객체가 메모리상에 생성됨.
	Class.forName("oracle.jdbc.OracleDriver");
//	2) Connection 객체생성(연결), SqlDeveloper를 이용하여 오라클DB접속
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	}catch(Exception ex) {
//		예외관련 메세지 출력.
		ex.printStackTrace();
		
	}finally {
//		연결 닫기.
		conn.close();
	}
%>