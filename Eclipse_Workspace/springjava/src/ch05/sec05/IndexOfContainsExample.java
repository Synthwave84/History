package ch05.sec05;

public class IndexOfContainsExample {
	public static void main(String[] args) {
//		문자열 찾기
		String subject = "자바 프로그래밍";
//		검색 문자열이 존재하지 않으면 -1의 값을 반환하고
//		위치를 숫자로 반환하기 때문에 숫자타입의 데이터타입을 써야한다.
//		숫자 데이터타입. int, long, float, double~
		int location = subject.indexOf("프로그래밍");
		System.out.println(location);
		
		String sub1 = subject.substring(3,8);
		System.out.println(sub1);
		
		location = subject.indexOf("자바");
		if(location != -1) {
			System.out.println("자바와 관련된 책 입니다.");
		}else {
			System.out.println("자바와 관련된 책이 아닙니다");
		}
		
		boolean result = subject.contains("자바");
		if(result) {
			System.out.println("자바와 관련된 책이네요");
		}else {
			System.out.println("자바랑 관련이 없는 책이에요");
		}
		
		
	}
}
