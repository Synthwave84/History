package ch11.sec03.exam03;

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
		String [] array = {"100", "1oo",null, "200"};
	
		for (int i=0; i<=array.length; i++) {
			try {
//				array[0], array[1], array[2]
			 int value = Integer.parseInt(array[i]);
			 System.out.println("array[" +i + "]: " +value);
			}catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("배열 인덱스가 초과됨 : " + e.getMessage());
//			
			}catch(NumberFormatException | NullPointerException e) {
				System.out.println("배열데이터에 문제가 있음 :" + e.getMessage());
			}
		}
	
	}
}
