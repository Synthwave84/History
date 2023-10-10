<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//	회원가입 폼에서 입력받은 데이터를 데이터베이스에 저장하는 기능 구현목적.
//	한글 깨짐 방지
	request.setCharacterEncoding("UTF-8"); 
//	입력한 데이터 참조
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	String addr = request.getParameter("addr");
	
//	데이터베이스 연결 목적
	Connection conn= null;
//	SQL 구문을 실행하기 위한 목적.
	PreparedStatement pstmt = null;
//	JDBC API 들은 예외발생처리를 하도록 문법 규칙이 존재한다.
	try {
// 	데이터베이스 연결 정보
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "ora_user";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
//	객체생성 = DB 연결
	conn = DriverManager.getConnection(url,id,pw);

	String sql = "INSERT INTO USERINFO(USERID, PASSWD, ADDR) VALUES(?,?,?)";
	pstmt = conn.prepareStatement(sql);
// 	입력한 값으로 연결.
//	첫번째 ? 의 값을 설정
	pstmt.setString(1, userid);
	pstmt.setString(2, passwd);
	pstmt.setString(3, addr);
	
//	숫자데이터일 시, pstmt.setInt(parameterIndex, x);
	
// 실행 pstmt객체가 가지고 있는 insert 문을 실행하는 메소드
//	INSERT,UPDATE,DELETE 문에 사용
	pstmt.executeUpdate();
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		if(pstmt != null ) {try{pstmt.close();}catch (Exception ex) {}
		if(conn != null ) {try{conn.close();}catch (Exception ex) {}
			}
		}
	}
	response.sendRedirect("selectList.jsp");
%>