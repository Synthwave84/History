package ch03.sec06;

public class CompareOperatorExample {
	public static void main(String[] args) {
//		비교연산자
//		1) 정수데이터
		int num1= 10;
		int num2= 10;
		
//		== 둘이 같은가? 그러므로 true or false
		boolean result1 = (num1 == num2); // 같다
		boolean result2 = (num1 != num2); // 같지않다
		boolean result3 = (num1 <= num2); // 작거나 같다
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(result3);
		
//		2) 문자데이터
		char char1 = 'A'; // 65 ASCII
		char char2 = 'B'; // 66 ASCII
		boolean result4 = (char1 < char2); // 65<66
		System.out.println(result4);
		
//		3) 정수, 실수 혼합비교연산
		int num3 = 1;
		double num4 = 1.0;
//		데이터 형변환이 일어난다. int -> double로
//		이를 타입일치. 라고 한다.
		Boolean result5 = (num3 == num4); // int == double -> (double) int == double;
		System.out.println(result5);
		
//		4) 실수 데이터 정밀도 (유효자리수).
		float num5 = 0.1f; // 0.2323122(float) ->(double) 0.23231220000000
		double num6 = 0.1; // 0.2323122232432323(double) -> float 0.2323122
		boolean result6 = (num5 == num6); // float == double ->
		boolean result7 = (num5 == (float) num6);
		System.out.println(result6); // false 0.23231220000000 == 0.23231223242323
		System.out.println(result7); // true 0.2323122 == 0.23231223242323
		
//		5) 문자열 데이터
		String str1 = "자바";
		String str2 = "JAVA";
//		문자열 비교시 str1==str2 사용 하면 안됨.(중요)
		boolean result8 = (str1.equals(str2)); 
		System.out.println(result8);
		boolean result9 = (!str1.equals(str2));
		System.out.println(result9);
	}
}
