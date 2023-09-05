package ch06.sec13.exam02.package1;

//  생성자 접근자 예제. public,priavate [default]
//  자신의 클래스에서 생성자의 접근자는 의미가 없다.
public class A {
//	필드선언
//	public = 초록
//	default = 파랑 삼각
//	private = 빨간 사각
	 A a1 = new A(true);
	 A a2 = new A(1);
	 A a3 = new A("문자열");
			
//	생성자 선언
	public A(boolean b) {}
	
//  접근자가 생략되면, default의 의미이다
	A(int b) {}
	
	private A(String s) {}
	
}
