package ch09.sec03.exam01;

public class A {
//	static 멤버클래스
	
//	클래스 코드만 메서드 영역에 생성
	static class B {}
	
	B field1 = new B();
	
	static B field2 = new B();
	
//	생성자
	A() {
		B b = new B();
	}
//	인스턴스 메소드
	void method1() {
		B b = new B();
	}
	
//	정적 메소드
	static void method2() {
		B b = new B();
	}
	
}
