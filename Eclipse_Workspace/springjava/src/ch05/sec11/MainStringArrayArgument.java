package ch05.sec11;


public class MainStringArrayArgument {
	public static void main(String[] args) {
//		JVM이 구동되면서, 자바프로그램의 main() 시작 메소드를 호출한다.
//		String[] args 사용법.
		
//		명령프롬프트 기반에서 파일을 독립적dmfh실행
//		javac MainStringArrayARgument.java
//		java mainStringArrayARgument 10 20
//		
//		
//		현재 이클립스 예제는 Run메뉴 = Run Configuration에서 클래스 mainStringArrayArgument 확인
//		- Argument 매개변수값 입력 10 20 - Run
		if(args.length != 2) {
			System.out.println("프로그램 입력값이 부족");
//			프로그램을 종료하는 기능
			System.exit(0);
		}
//		main() 메소드의 매개변수를 2개 제공했을 때 라면
		String strNum1= args[0];
		String strNum2= args[1];
		
//		문자열을 정수형으로 변환. 예> "10" -> 10 변환
		int num1 =  Integer.parseInt(strNum1);
		int num2 =  Integer.parseInt(strNum2);
		int result = num1+ num2;
		System.out.println(num1 + " + " + num2 + " = " + result);
		
		
		
		
		
		
		
		
		
		
	}
}
