package ch05;

public class ValueTypeReferenceType {
	public static void main(String[] args) {
//	기본타입과 참조타입의 기억장소 관리개념.
		
//		기본타입 : 8개 , 정수형타입byte,short,char,int,long, 실수형타입float/double, 논리형타입boolean
//		참조타입 : 4개 , 배열, 열거, 클래스, 인터페이스
		
//		JVM은 프로그램 실행시ㅡ 필요한 기억장소를 메소드영역, 스택영억, 힙영역으로 나눈다.
//		세 영역은 각각 프로그램에 필요한 정보를 관리한다. 
//		메소드 영역: 클래스파일(byte code)를 읽어들인 코드가 사용
//		스택 : 기본 데이터타입과 참조타입 사용
//		힙 :참조타입만 사용		
		int a = 10; // 기본타입 : 정수형 문법
		
		int [] arr = new int [] {1,2,3}; // 참조타입 : 배열문법
//		참조타입은 1)int[]arr 2) arr = new int[] {} 로 형태가 나뉘며
//		1) int[]arr  구문은 스택영역에 기억장소가생성되고
//		2) arr = new int[] {1,2,3} 구문은 힙 영역에 기억장소가 생선된다.
//		그리고 생성된 기억장소의 주소가 스택영역에 대입된다. 
	}
}
