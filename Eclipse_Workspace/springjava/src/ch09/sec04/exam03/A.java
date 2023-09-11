package ch09.sec04.exam03;

public class A {
//	메소드
//	final int arg의 성격을 가지고 있다. jdk 1.8이후 부터는
//	final int arg 로 적어야 한다. 이 이전에는 final 을 적지 않아도 final 로 
//	컴파일 되었다.
	public void method1(final int arg) {
//		로컬변수
		int var = 1; // final int var = 1;
//		var = 2; 변경 가능
		
//		로컬클래스
		class B{
//			메소드
			void method2 () {
//				로컬 변수읽기.
//				접근가능
//				jdk 1.8이후에서는 매개변수에 final 키워드 사용할것.
				System.out.println("arg: " + arg);
//				접근 가능
				System.out.println("var: " + var);
				
//				로컬 변수 수정
//				arg = 2;	불가능
//				var = 2;  불가능
								}
				}
		//	 로컬 객체생성
		B  b = new B();
		b.method2();
//		arg = 3;
//		var 3;
	
	
	
	}
	
	
	
}
