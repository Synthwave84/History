<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파일 업로드 예제</h3>
<form method="post" action="./upload" enctype="multipart/form-data">
	<input type="file" name="files"><br>
	<input type="file" name="files"><br>
	<input type="file" name="files"><br>
	<input type="file" name="files"><br>
	<input type="submit" value="파일 업로드">	
</form>
</body>
</html>