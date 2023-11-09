<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>write</h3>
	<form method="post" action="./join">
		글쓴이 :  <input type="text" name="writer"> <br>
		제목 :   <input type="text" name="title">	<br>
		내용 :   <input type="text" name="content"> <br>
		<input type="submit" value="회원가입">
	</form>
	<a href=/sample2/write?writer=James&title=Iamprokiller&content=007>전송 GET</a>
</body>
</html>