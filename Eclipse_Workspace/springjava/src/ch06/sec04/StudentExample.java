package ch06.sec04;

public class StudentExample {
//	시작 메소드
	public static void main(String[] args) {
		
//		클래스 사용법
//		데이터타입 변수 = new 데이터타입이름();
//		(클래스) => new = 생성자 함수()
		
//		s1 = heap 영역에 주소가 존재한다. 주소를 찾아가서 정보를 사용한다
		Student s1 = new Student();
		System.out.println("s1변수가 Student 객체를 참조합니다.");
		
		Student s2 = new Student();
		
		System.out.println("s2변수가 Student 객체를 참조합니다");
		
		
		
	}

}
