<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String userid= request.getParameter("userid");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
		   	String id = "ora_user";
		   	String pw = "1234";
		   
		    Class.forName("oracle.jdbc.OracleDriver");
		    conn = DriverManager.getConnection(url, id, pw); // 객체생성. = DB연결.
		    String sql = "DELETE FROM USERINFO WHERE USERID= ? ";
		    pstmt= conn.prepareStatement(sql);
		    
		    pstmt.setString(1, userid);
		    
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