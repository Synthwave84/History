package ch03.sec04;

public class AccuracyExample1 {
	public static void main(String[] args) {
//	실수데이터타입이 부동소숫점 방식으로 인한 연산 오차 발생 예제.
//	예제 = 사과 1개를 0.1 단위의 10조각으로 보고, 그 중 7 조각을 뺀 3조각 변수저장
//	해결 방법 :1) 정수변환 방법. 2 )BigDecimal 클래스 사용. 3 )라이브러리 활용
		int apple = 1;
		double pieceUnit = 0.1;
		int number = 7;
		
		
//		1 - 7 *0.1 , 일반적인 생각 = 0.3이라고 생각한다.
		double result =apple - pieceUnit * number;
		System.out.println("result :" + result);
//		result :0.29999999999999993

	}
}
