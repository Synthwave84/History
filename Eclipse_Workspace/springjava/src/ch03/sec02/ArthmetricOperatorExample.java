package ch03.sec02;

public class ArthmetricOperatorExample {
	public static void main(String[] args) {
		// 산술연산자  +,- *, / , %
		byte v1 = 10;
		byte v2 = 4;
		byte v3 = 5;
		long v4 = 100L;
		
		int result1 = v1+ v2;
		System.out.println("result1: " +result1);
		
		long result2 = v1 +v2 - v4;
		System.out.println("result2: "+ result2);
		
		double result3 = v1 / v2;
		System.out.println("result3: " + result3);
		
		long result4 = v1 % v2;
		System.out.println("result4:" + result4);
		
	}
}
