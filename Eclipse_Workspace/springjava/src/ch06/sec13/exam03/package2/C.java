package ch06.sec13.exam03.package2;

import ch06.sec13.exam03.package1.A;

public class C {
	public C() {
		// 객체 생성
		A a = new A();
		
// 필드값 변경

//		public 접근 제약 없음
		a.field1 = 1;

//		[default] 다른 패키지 접근 불가
//		a.field2 = 1;

//		private 동일패키지 내 라도접근 불가하므로, 접근 불가.
//		a.field3 = 1;
		
//		public
		a.method1();

//		[default]
//		a.method2();
		
//		private
//		a.method2();
	
	}
}
