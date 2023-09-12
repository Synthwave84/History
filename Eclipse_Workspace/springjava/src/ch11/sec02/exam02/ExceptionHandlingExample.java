package ch11.sec02.exam02;

// 예외처리를 하는 경우

// 1. 실행시 발생되는 오류(예외)를 비정상적인 종료르 막고자 한다.
// 2. JDK 명령어인 메소드중 예외 처리를 하도록 만든 것이 존재하여, 
// 예외처리를 해야 한다.

public class ExceptionHandlingExample {
	public static void main(String[] args) {
		
//		클래스 fullname. = 
		try {
			Class.forName("java.lang.String");
			System.out.println("java.lang.String클래스가 존재합니다");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println();
		
		try {
//			예외 발생! java.lang패키지에 String2 클래스가 존재하지 않는다.
			Class.forName("java.lang.String2");
			System.out.println("java.lang.String2 클래스가 존재합니다.");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}
}
