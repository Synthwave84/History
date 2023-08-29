package ch05.sec05;

public class EmptyStringExample {
	public static void main(String[] args) {
//		String클래스의 초기값 설정
//		참조타입의 변수는 초기값을 null로 한다.
//		'.' 은 참조 연산자를 의미한다.참조하고자 하는 값이 null이면 사용 불능이다.
		String hobby = ""; // null보다는 "" 빈 문자열을 주로 사용한다
		if (hobby.equals("")) {
			System.out.println("Hobby 변수가 참조하는 String 객체는 빈 문자열이다.");
		}
	}
}
