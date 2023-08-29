package ch05.sec04;

public class GarbageObjectExample {
	public static void main(String[] args) {
//		String클래스 : 문자열 데이터를 사용하는 목적
//		참조타입 이지만, 사용방식은 기본 데이터타입 스타일 처럼 사용 할 수 있다.
		
		String hobby = "여행"; // Heap 영역의 "여행"  이라는 문자열 데이터가 저장되는 주소를 할당한다.
		hobby = null; // 할당된 주소가 없기 때문에, 쓰레기라고 한다.
		
		 String kind1 = "자동차";
		 String kind2 = kind1;  // 힙 영역의 "자동차" 가 저장되어있는 주소를 kind1로부터 대입.
		 kind1= null;
		 System.out.println("kind2:" + kind2);
		 
//       GC(Garbage Collector): 사용하지 않는 객체의 힙메모리를 소멸시키고, 메모리를 관리. 
	}
}
