<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp수정을 하더라도 tomcat서버는 재시작 안 해도 된다.  -->
<!-- product.name은 getName() 메소드를 참조한다 -->
<!-- product.price은 getPrice() 메소드를 참조한다 -->
<p>상품명 : ${product.name }</p>
<p>상품가격 : ${product.price }</p>
</body>
</html>