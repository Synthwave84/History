package ch03.sec07;

public class LogicalOperatorExample {
	public static void main(String[] args) {
//		논리 연산자
		int charCode = 'A'; // int = char => (int)char;
		
//		&,| vs &&, || 동작원리가 다르다
		
		
//		65 <= charCode <=90 = 대문자
		if ((65 <= charCode) & (charCode <=90)) {
			System.out.println("대문자입니다");
//		아래 구문에서 첫 조건식이 false이면, 두번쨰 조건식은 판단(실행)하지 않는다.
		}
		if ((97 <= charCode) && (charCode <=122)) {
			System.out.println("소문자입니다.");
		}
		if((48 <= charCode) && (charCode <=57)) {
			System.out.println("0~9 숫자 입니다.");
		}
		
		/*--------------------------------------------*/
		int value = 6;
		if((value%2==0) | (value%3==0)) {
			System.out.println("2 또는 3의 배수이군요.");
		}
//		아래 구문에서 첫 조건식이 true이면, 두번쨰 조건식은 판단(실행)하지 않는다.
		boolean result = (value%2==0) || (value%3==0);
		if (!result) {
			System.out.println("2또는 3의 배수가 아니군요.");
		}
	}
}
