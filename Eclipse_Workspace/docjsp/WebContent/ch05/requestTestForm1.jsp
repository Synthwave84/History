<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request 예제 - 요청메소드</h2>
<form>
	이름 : <input type="text" name="name" placeholder ="이름입력"><br>
	나이 : <input type="number" name="age" placeholder ="나이입력"><br>
	성별 : <input type="radio" name="gender" value="male" checked="checked">남자
	        <input type="radio" name="gender" value="female" checked="checked">여자<br>
	좋아하는 취미 :
	<select>
		<option value="잠자기">잠자기</option>	
		<option value="무협지보기">무협지보기</option>	
		<option value="애니메이션 시청">애니메이션 시청</option>	
		<option value="건프라">건프라</option>	
	</select><br>
	<input type="submit" value="전송">
	
</form>
</body>
</html>