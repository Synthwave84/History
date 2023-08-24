package ch02.sec02;

public class LongExample {

	public static void main(String[] args) {
		// long데이터 타입 : 크기 8 byte  범위 : -2^63~ 2^63-1
		
		long var1= 10; // 10은 int 형
		long var2 = 10L; // Long이란 데이터 타입은 L or l 접미사가 꼭 들어가야한다.
//		long var3 = 10000000000; // 값이 int형으로 인식되기 때문에 에러 발생한다. int범위 벗어남.
		long var3 = 10000000000L;
		
		System.out.println(var1);
		System.out.println(var2);
		System.out.println(var3); // sout Ctrl + space
		
	
	}

}
