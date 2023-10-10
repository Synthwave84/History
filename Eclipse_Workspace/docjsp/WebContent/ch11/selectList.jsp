<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, td {
  		border: 1px solid;
}

	table {
  		width: 100%;
}
</style>
<script>
	function fn_del(userid) {
		// alert(userid);
		if(!confirm(userid +" 삭제를 하시겠습니까?")) return;
		
		location.href = "deletePro.jsp?userid=" + userid;
			
		
	}



</script>
</head>
<body>
<table>
	<tr>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>주소</th>
	<th>비고</th>
</tr>
    
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	
//	SQL구문이 select문을 사용할 경우에는
	ResultSet rs = null;

	try {
//	데이터베이스 연결정보
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
   	String id = "ora_user";
   	String pw = "1234";
   
    Class.forName("oracle.jdbc.OracleDriver");
    conn = DriverManager.getConnection(url, id, pw); // 객체생성. = DB연결.
    String sql = "SELECT USERID, PASSWD, ADDR FROM USERINFO ORDER BY USERID";
   	pstmt= conn.prepareStatement(sql);
//	SELECT 문에서 사용
	rs = pstmt.executeQuery();
	while (rs.next()) {
		String userid = rs.getString("USERID");
		String pwd = rs.getString("PASSWD");
		String adrs = rs.getString("ADDR");
//		숫자데이터 = rs.getInt
%>
<tr>
	<td><%= userid %></td>
	<td><%= pwd %></td>
	<td><%= adrs %></td>
	<td><input type="button" value="delete" onclick="fn_del('<%= userid%>')"></td>
</tr>
<% 

	}


	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		if(rs != null ) {try{rs.close();}catch (Exception ex) {}
		if(pstmt != null ) {try{pstmt.close();}catch (Exception ex) {}
		if(conn != null ) {try{conn.close();}catch (Exception ex) {}
		}
		}
		}
	}
	
%>
</table>
<a href="insertForm.jsp">돌아가기</a>
</body>
</html>
