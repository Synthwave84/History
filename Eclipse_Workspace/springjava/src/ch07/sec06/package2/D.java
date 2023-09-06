package ch07.sec06.package2;
// 상속관계인 경우 다른 패키지의 멤버가 protected 접근자 일 때 접근 가능.
import ch07.sec06.package1.A;

public class D extends A {

	public D() {
		super();
	}
	
	public void method1() {
		this.field = "value";
		this.method();
	}
	
	public void method2() {
//		하단의 코드는 상속개념이 아니라 가져다 쓰는 것 이므로, 사용할 수 없다.
//		자식 개념에서 사용하는 의미가 아니라, 일반적인 형태로 가져다 쓰는것 이기 때문에
//		접근 할 수 없다
//		A a = new A();
//		a.field = "value";
//		a.method();
	}
}
