<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>SampleDTOList 클래스 사용예제</h3>
	<form method="post" action="./beanPro">
		이름 : <input type="text" name="list[0].name"><br>
		나이 : <input type="text" name="list[0].age"><br>
		이름 : <input type="text" name="list[1].name"><br>
		나이 : <input type="text" name="list[1].age"><br>
		이름 : <input type="text" name="list[2].name"><br>
		나이 : <input type="text" name="list[2].age"><br>
		
	<input type="submit" value="전송">
	
	</form>
</body>
</html>