package ch07.sec04.exam01;

public class Calculator {
//	메소드 오버라이딩 (재정의)
//	부모클래스의 메소드 이름을 자식클래스에서 사용하여 , 메소드를 
//	재정의 하는 문법
//	메소드 선언
	public double areaCircle(double r) {
		System.out.println("Calculator객체의 areaCircle() 실행");
		return 3.14159 * r * r;
	}
}
