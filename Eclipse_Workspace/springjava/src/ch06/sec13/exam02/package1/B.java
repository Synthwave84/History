package ch06.sec13.exam02.package1;

public class B {
	A a1 = new A(true);
	A a2 = new A(1);
//	A("문자열");은 private 로 선언되어 동일 패키지 내의 클래스에서도 호출이 안된다.
//	A a3 = new A("문자열");
}
