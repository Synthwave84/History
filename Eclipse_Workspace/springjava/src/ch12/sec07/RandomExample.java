package ch12.sec07;

import java.util.Arrays;
import java.util.Random;

//  Random 예제
//  Random random = new Random(3) = 꼬정된 값
//  Random random = new Random() = 랜덤값


public class RandomExample {
	public static void main(String[] args) {
		
//		선택번호
//		기본값 0
		int[] selectNumber = new int[6]; 
//		종자값 (seed)
		Random random = new Random(3);
		System.out.println("선택번호 : ");
		for(int i=0; i<6; i++) {
//			1~45의 범위값
			selectNumber[i] = random.nextInt(45) + 1;
			System.out.println(selectNumber[i] + "");
		}	/*15 21 16 17 34 28*/
		System.out.println();
		
//		당첨번호
		int[] winningNumber = new int[6]; 
//		종자값 (seed)
		random = new Random(5);
		System.out.println("당첨번호 : ");
		for(int i=0; i<6; i++) {
//			1~45의 범위값
			selectNumber[i] = random.nextInt(45) + 1;
			System.out.println(selectNumber[i] + "");
		} /*18 38 45 15 22 36*/
		System.out.println();
		
//		당첨 여부
		Arrays.sort(selectNumber); // 15 16 17 21 28 34
		Arrays.sort(winningNumber); // 15 18 22 36 38 45
		boolean result = Arrays.equals(selectNumber, winningNumber);
		if(result) {
			System.out.println("1등당첨");
		}else {
			System.out.println("당첨 안됨");
		}
		
		
		
	}
}
