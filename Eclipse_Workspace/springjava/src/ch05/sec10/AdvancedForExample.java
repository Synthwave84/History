package ch05.sec10;

public class AdvancedForExample {
	public static void main(String[] args) {
//		배열을 접근하기 위한 향상된 for 문법
		
		int [] scores = {95,71,84,93,87};

//		1] 배열의 합 > 기본 for문
//		int sum=0;
//		for(int i=0; i<scores.length;i++) {
//			sum+= scores[i];
//		}
		
//		2] 향상된 for 문
//		for(배열 요소의 값을 받는 변수 선언 : 배열) {
//			
//		}
		int sum = 0 ;
		for (int score : scores) {
			sum += score;
		}
		System.out.println("점수의 총 합 : " + sum);
		double avg = (double) sum / scores.length;
		System.out.println("점수 평균 : " + avg);
		
		
		
		
		
		
		
		
		
	}
}
