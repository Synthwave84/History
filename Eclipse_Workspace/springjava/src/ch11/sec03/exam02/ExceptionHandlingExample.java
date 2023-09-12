package ch11.sec03.exam02;

//  다중예외처리 예제 - 실행시 오류가 2개이상 존재했을 때 예외 처리 하는 방법
//  배열의 array[1] 값이 숫자 형태의 값이 아니므로 정수 변환시 에러 발생.
//	NumberFormatException -> Exception 대체
//	배열의 array[2] 인덱스가 존재하지 않아, 에러 발생.
//	ArrayIndexOutOfBoundsException
//	다중 예외 처리시 catch() 구문에서 상위예외클래스가 
//	가장 하단에 작업되어야 한다.
public class ExceptionHandlingExample {
	
	
	public static void main(String[] args) {
//		알파벳 o 를 입력.
		String [] array = {"100", "1oo"};
	
		for (int i=0; i<=array.length; i++) {
			try {
//				array[0], array[1], array[2]
			 int value = Integer.parseInt(array[i]);
			 System.out.println("array[" +i + "]: " +value);
			}catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("배열 인덱스가 초과됨 : " + e.getMessage());
//			NumberFormatException 클래스를 사용해야 하지만, 상위클래스로 대신 작업
//					Exception 클래스는 상단의 ArrayEx... 클래스보다 상위 클래스 이므로,
//					가장 하단에 작성해 주어야 한다.
			}catch(Exception e) {
				System.out.println("실행에 문제가 있습니다");
			}
		}
	
	}
}
