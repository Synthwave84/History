package ch11.sec02.exam01;

// 8 라인이 예외 발생되어 예외처리를 적용한 예제.
public class ExceptionHandlingExample2 {
	public static void printLength(String data) {
		try {
//			참조연산자는 주소값을 가지고 있을 때 사용
			int result = data.length();
			System.out.println("문자수 : " +  result);
		}catch(NullPointerException e) {
			System.out.println(e.getMessage());
//		예외 발생 여부와 상관없이 공통적으로 실행 된다.
		}finally {
			System.out.println("[마무리 실행]");
		}
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
