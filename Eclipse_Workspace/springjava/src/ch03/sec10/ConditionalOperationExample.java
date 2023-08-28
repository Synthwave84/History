package ch03.sec10;

public class ConditionalOperationExample {
	public static void main(String[] args) {
//		3항 연산자.
		int score = 90;
		char grade = (score > 90) ? 'A': ((score > 80) ? 'B' : 'C');
		System.out.println(score + "점은 " + grade + "등급입니다.");
		
		// if문 printf(문) 사용해서 코드 처리	
//		if (score <80) {
//			System.out.printf("C 등급 입니다.");
//		} else if (score >=80 & score <=90) {
//			System.out.printf("B 등급입니다.");
//		} else if (score >90){
//			System.out.printf("A 등급입니다." );
//		}
//	
		if (score > 90) {
				grade = 'A';
		} else if (score > 80) {
				grade = 'B';
		} else {
				grade = 'C';
		}
		// %d, %c, %f, %s
		System.out.printf("%d점은 %c등급입니다." ,score , grade);
	}
}
