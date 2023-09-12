package ch11.sec02.exam01;

// 예외 처리가 안된 예제
//  예외발생되어 프로그램이 비정상 종료되었다.
public class ExceptionHandlingExample1 {
	public static void printLength(String data) {
		int result = data.length();
		System.out.println("문자수 : " +  result);
	}
	
	
	public static void main(String[] args) {
		System.out.println("[ 프로그램 시작]\n");
		printLength("ThisIsJava");
//		에러 발생 -> 비정상적인 종료
		printLength(null); 
//		이 라인은 위에서 예외발생이 되어, 정상적인 실행을 하지 못한다.
		System.out.println("[프로그램 종료]");
		
	}
}
