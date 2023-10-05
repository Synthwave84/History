<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 예제 1 - 요청 메서드</h2>
	<form method="get" action="requestprocess1.jsp"> 
		이름: <input type="text" name="name" placeholder="이름 입력" /><br />
		나이: <input type="number" name="age" placeholder="나이 입력" /><br />
		성별: <input type="radio" name="gender" value="male" checked>남자
			  <input type="radio" name="gender" value="female">여자<br />
		좋아하는 취미:
		<select name="hobby">
			<option value="잠자기">잠자기</option>
			<option value="무협지보기">무협지보기</option>
			<option value="애니메이션시청">애니메이션시청</option>
			<option value="건프라">건프라</option>
		</select><br>
		<input type="submit" value="전송" />
	</form>
</body>
</html>