package ch05.sec09;

public class ArrayCopyByForExample {
	public static void main(String[] args) {
//		배열은 크기를 변경 불가능
//		배열 복사 예제
		
//		길이가 3인 배열 생성
		int[] oldIntArray = {1,2,3};
		
		
		
//		수많은 작업
		
		
		
		
		
//		사본 : 길이가 5인 배열 
//		배열이 int 형이므로 초기값이 0으로 설정된다.
		int[] newIntArray = new int[5]; 
//		배열 출력: 배열 복사 이전
		for(int i=0; i<newIntArray.length; i++) {
			System.out.print(newIntArray[i] + ",");
			
		}
		System.out.println();
		System.out.println("--------------------------------------------------");
//		배열 복사
		for(int i=0; i<oldIntArray.length; i++) {
			newIntArray[i] = oldIntArray[i];
		}
//		배열 출력
		for(int i=0; i<newIntArray.length; i++) {
			System.out.print(newIntArray[i] + ",");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
