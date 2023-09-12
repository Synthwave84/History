package ch11.sec05;

//	예외 떠넘기기 (예외전가)
public class ThrowExample1 {
	public static void main(String[] args) {			
//		findClass();
		

	}
	
	
//	예외 전가 : throws ClassNotFoundException
//	이 메소드를 호출한 쪽으로 예외 떠넘기기.
	public static void findClass () throws ClassNotFoundException {
		Class.forName("java.lang.String2");
	}
}
