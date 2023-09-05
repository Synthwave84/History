package ch06.sec13.exam03.package1;

public class B {
//	 메모리 생성 작업을 하고 이후에 접근 작업.
//	 A클래스의 인스턴스 멤버를 사용하기 위해서 객체생성작업 필요.
	
//	객체생성
//	필드 선언 자체는 가능하나, 코딩이불가능하다.
//	사옹시에는 꼭 메소드에 담아야한다.
//	A a = new A();
	
	
//	객체 생성
	public void method() {
//		객체 생성
		
		A a = new A();
//		필드값 변경
		a.field1 =1;
		a.field2 =2;
//		a.field3 = 1; <private 라 접근이 안된다.
		
//		메소드 호출
		a.method1();
		a.method2();
//		a.method3(); <private 메소드 이므로 접근이 불가능하다.
		
		
		
		
		
		
		
	}
	
}
