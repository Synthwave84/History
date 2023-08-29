package ch05.sec06;

public class ArrayCreateByValueListExample2 {
	public static void main(String[] args) {
//		참조타입의 주소복사
		
//		int[] scores;
//		scores = new int[] {83,90,87};
//		
//		int sum1= 0;
//		for (int i=0; i<3; i++) {
//			sum1 += scores [i];
//		}
//		System.out.println("총합 ; " + sum1);
		printItem( new int[] {83,90,87});
		printItem( new int[] {50,85,64});
		printItem( new int[] {98,88,77});
	}
//	메소드 정의
	public static void printItem(int [] scores) {
		int sum= 0;
		for(int i=0; i<scores.length; i++) {
			sum += scores[i];
			System.out.println("score [" + i + "] : " + scores[i]);
		}
		System.out.println("-----------------------------------------------");
		System.out.println("총합 : " +sum);
		System.out.println("평균 : " + (double) sum / scores.length);
		System.out.println("-----------------------------------------------");
	} 

} 


