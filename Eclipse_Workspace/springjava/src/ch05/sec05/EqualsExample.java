package ch05.sec05;

public class EqualsExample {
	public static void main(String[] args) {
//		String클래스는 참조타입이지만, 기본 데이터 타입 스타일과 참조데이터 타입 스타일
//		2가지의 특징을 가지고 있다.
//		String 클래스 : 힙 영역에서 생성한 동일한 문자열 데이터의 주소를 공유한다.
		String strVar1 = "홍길동";
		String strVar2 = "홍길동";

//		String 변수와 주소 비교는 == 비교 연산자를 사용한다.
		if(strVar1 == strVar2) {
			System.out.println("strVar1과 strVar2는 참조주소가 같다");
		}else {
			System.out.println("strVar1과 strVar2는 참조주소가 다르다");
		}
//		데이터 비교
		if(strVar1.equals(strVar2)) {
			System.out.println("strVar1과 strVar2는 문자열 데이터가 같다.");
		}
//		2) 참조타입 스타일
		String strVar3 = new String("홍길동");
		String strVar4 = new String("홍길동");
		
//		주소 비교
		if(strVar3 == strVar4) {
			System.out.println("strVar3과 strVar4는 참조주소가 같다");
		}else {
			System.out.println("strVar3과 strVar4는 참조주소가 다르다");
		}
//		데이터 비교
		if(strVar3.equals(strVar4)) {
			System.out.println("strVar3과 strVar4는 문자열 데이터가 같다.");
		}
	}
}
