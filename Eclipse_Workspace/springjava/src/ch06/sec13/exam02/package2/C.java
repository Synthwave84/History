package ch06.sec13.exam02.package2;

import ch06.sec13.exam02.package1.A;

public class C {
//	생성자는 다른 패키지이지만, public 이기 때문에 호출이 가능하다.
	A a1 = new A(true);
//	default 생성자라 한 패키지 내 에서만 호출이 가능하므로, 호출 할 수 없다.
//	A a2 = new A(1);
//	private 생성자라 한 패키지 내라 할 지라도, 동일 클래스 내에서만 호출이 가능하다.
//	그런고로 현재 다른 패키지 + 다른 클래스라 호출이 불가하다. 
//	A a3 = new A("문자열");
}
