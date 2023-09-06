package ch07.sec04.exam01;

public class Computer extends Calculator {
	
	
//	메소드 오버라이딩을 필요로 할 경우, 
//	부모 메소드의 선언부(리턴 타입, 메소드 이름, 매개변수)와 동일해야 한다 
//	Annotation : 컴파일러에게 하단 메소드가 재정의 된 메소드임을 
//	알리는 목적으로 사용한다. 쓰지 않아도 상관 없으나, 작성을 권장한
	@ Override 
	public double areaCircle(double r) {
		System.out.println("Computer 객체의 areaCircle() 실행");
		return Math.PI* r * r;
	}
}
