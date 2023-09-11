package ch09.sec02.exam01;

public class AExample {
	public static void main(String[] args) {
//		A  객체 생성
		A a = new A();
	
		System.out.println(a.a);
		
		A.B b1 = a.new B();
		A.B b2 = a.new B();
		A.B b3 = a.new B();
		A.B b4 = a.new B();
		System.out.println(b1.b);
	}
}
