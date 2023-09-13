package ch12.sec06;

//	박싱과 언박싱 예제
//	형변환 : 스택영역 -> 힙영역, 힙영역 -> 스택영역

public class BoxingUnBoxingExample {
	public static void main(String[] args) {
//		Boxing
//		스택 영역에 주소가 저장되고, 힙 영역에 값이 저장된다.
		Integer obj = 100;
		System.out.println("value : " + obj);
		
//		UnBoxing
//		힙영역에 들어와 있는 값을 스택 영역으로 옮긴다.
		int value = obj;
		System.out.println("value : " + value);
		
//		연산 시 Unboxing
		int result = obj + 100;
		System.out.println("result : " + result);
	}
}
