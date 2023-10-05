<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 예제 3 - 요청 메서드</h2>
	<form method="post" action="requestprocess3.jsp"> 
		좋아하는 취미:
		야구<input type="checkbox" name="hobby" value="야구" />
		농구<input type="checkbox" name="hobby" value="농구" />
		탁구<input type="checkbox" name="hobby" value="탁구" />
		축구<input type="checkbox" name="hobby" value="축구" />
		<input type="submit" value="전송" />
	</form>
</body>
</html>