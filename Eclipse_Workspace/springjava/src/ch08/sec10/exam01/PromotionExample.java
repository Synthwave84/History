package ch08.sec10.exam01;

public class PromotionExample {
	public static void main(String[] args) {
//		구현객체생성
		B b = new B();
		C c = new C();
		D d = new D();
		E e = new E();
		
//		인터페이스 변수 생성
		A a;
		
//		a 변수에 구현 객체 대입 > 자동 형변환 가
		a = b;
		a = c;
		a = d;
		a = e;
		
	}
}
