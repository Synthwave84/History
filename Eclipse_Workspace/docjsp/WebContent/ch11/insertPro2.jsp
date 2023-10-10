<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 회원가입 폼에서 입력한 데이터를 데이터베이스에 저장하는 기능.
request.setCharacterEncoding("utf-8"); // 한글깨짐방지

// 입력한 데이터 참조
String userid = request.getParameter("userid");
String passwd = request.getParameter("passwd");
String addr = request.getParameter("addr");

Connection conn = null; // 데이터베이스 연결 목적
PreparedStatement pstmt = null; // SQL구문을 실행하기 위함.

// JDBC API들은 예외발생처리를 하도록 문법규칙이 존재한다.
try {
   // 데이터베이스 연결정보(접속정보)
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = "ora_user";
   String pw = "1234";
   
    Class.forName("oracle.jdbc.OracleDriver");
    conn = DriverManager.getConnection(url, id, pw); // 객체생성. = DB연결.
    
    String sql = "INSERT INTO USERINFO(USERID, PASSWD, ADDR) VALUES(?,?,?)";
    pstmt = conn.prepareStatement(sql);
    
    // 입력한 값 연결.
    pstmt.setString(1, userid); // 첫번째 ?에 값을 설정
    pstmt.setString(2, passwd);
    pstmt.setString(3, addr);
    
    // 숫자데이터 pstmt.setInt(parameterIndex, x);
    
    // 실행 : pstmt객체가 가지고 있는 insert문을 실행하는 메소드
   pstmt.executeUpdate();
    
}catch(Exception ex) {
   ex.printStackTrace();
}finally {
   if(pstmt != null){try{pstmt.close();}catch(Exception ex){}
   if(pstmt != null){try{conn.close();}catch(Exception ex){}
      }
   }
}

%>











