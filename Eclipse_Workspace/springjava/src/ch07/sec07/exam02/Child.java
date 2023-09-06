package ch07.sec07.exam02;

//  형변환
//  상속관계시 부모 클래스의 재정의 (Overriding)된 메소드 호출
public class Child extends Parent {
	
	@Override
	public void method2() {
		System.out.println("Child -method2()");
	}
	
	// 추가 메소드
	public void method3() {
		System.out.println("Child -method3()");
	}
}
