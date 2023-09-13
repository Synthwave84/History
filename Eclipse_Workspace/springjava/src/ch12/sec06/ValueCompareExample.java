package ch12.sec06;

public class ValueCompareExample {
	public static void main(String[] args) {
		
//		참조타입 변수 = 기본데이터 타입 int 형 값.
//		300이라는 값이 힙 영역에 메모리생성되어 저장되고,
//		그곳의 주소가 할당된다.(Boxing)
		
		
//		-128~127 초과 값일 경우
		Integer obj1 = 300;
		Integer obj2 = 300;
		
//		값 비교시  equals() 메소드 사용할것. (재 정의되어 내부의 값이 비교된다.)
		
		System.out.println("== : " + (obj1 == obj2));
		System.out.println("equals()" + obj1.equals(obj2));
		
//		-128~127 범위 내 값일 경우
		Integer obj3 = 10;
		Integer obj4 = 10;
		System.out.println("== :" + (obj3==obj4)); // true
		System.out.println("equals() : "+ obj3.equals(obj4)); // true 값 비교시
	}
}
