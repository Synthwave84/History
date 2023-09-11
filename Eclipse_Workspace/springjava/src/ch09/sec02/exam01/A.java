package ch09.sec02.exam01;


//중첩 클래스
public class A {
	
	int a = 10000;
	
	
//인스턴스 멤버 클래스
class B {
//	구성요소필드, 메소드, 생성자
	double b = a/10;
}

//인스턴스 필드값으로 B객체 도입
B field = new B();

A() {
	B b = new B();
}

//인스턴스 메소드
void method( ) {
	B b = new B();
}


}
