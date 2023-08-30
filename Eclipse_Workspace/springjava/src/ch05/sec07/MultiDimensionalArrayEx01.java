package ch05.sec07;

public class MultiDimensionalArrayEx01 {
	public static void main(String[] args) {
//		다차원배열
		/*
		int [] arr; 1차원
		int [] [] arr; 2차원배열
		int [] [] [] arr; 3차원 배열
		
		1차원 배열
		int[] arr = {80,90,96};
		arr.length 3
		arr[0]
		arr[1]
		arr[2]
		
		for문 1번 사용
		*/
		
//		2차원 배열
		int [] [] scores = { 
				{80,90,96}, // 1반 scores[0]
				{76,88}};		// 2반 scores[1]
		
//		배열의 길이
//		행의 갯수
		System.out.println("1차원 배열의 길이(반의 수) : " + scores.length);
		System.out.println("2차원 배열 길이( 첫번째 반의 학생 수 : " +scores[0].length);
		System.out.println("2차원 배열 길이( 두번째 반의 학생 수 : " +scores[1].length);
		
//		첫번째 반의 3번 학생점수 읽어오기
		System.out.println("scores[0][2] : " + scores[0][2]);
		System.out.println("scores[1][1] : " + scores[1][1]);
		
		int class1Sum= 0;
		for(int i=0; i<scores[0].length; i++) {
			class1Sum += scores[0][i];
		}
		
		double class1Avg = (double) class1Sum / scores[0].length;
		System.out.println("첫번째 반의 평균 점수: " + class1Avg);
		
		int class2Sum= 0;
		for (int i=0; i<scores[1].length; i++) {
			class2Sum += scores[0][i];
		}
		double class2Avg = (double) class2Sum/ scores[0].length;
		System.out.println("두번쨰 반의 평균 점수 : " + class2Avg);
		
		int totalStudent = 0;
		int totalSum = 0;
		
		for (int i=0; i<scores.length; i++) {
			totalStudent +=scores[i].length;
			for(int k=0; k<scores[i].length; k++) {
				totalSum += scores[i][k];
				
			
			}
			double totalAvg = (double) totalSum / totalStudent;
			System.out.println("전체 학생의 평균 점수: " + totalAvg);
		}
		
	}
}
