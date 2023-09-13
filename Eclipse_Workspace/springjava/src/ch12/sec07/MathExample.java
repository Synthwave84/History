package ch12.sec07;

public class MathExample {
	public static void main(String[] args) {
		
//		큰 정수 또는 작은 정수 얻기
//		올림 : 반올림 무시
		double v1 = Math.ceil(5.3);
//		내림 : 반올림 무시
		double v2 = Math.floor(5.3);
		System.out.println("v1 = " + v1);
		System.out.println("v2 = " + v2);
		
		long v3 = Math.max(3,7);
		long v4 = Math.min(3,7);
		System.out.println("v3 = " +v3);
		System.out.println("v4 = " +v4);
		
		// 소수 네자리
		double value = 12.3456;
//		1234.56
		double temp1 = value * 100;
//		1235
		long temp2= Math.round(temp1);
//		1235/ 100.0
		double v5 = temp2 / 100.0;
//		12.35
		System.out.println("v5 = " + v5);
		
		
	}
}
