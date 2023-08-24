package ch02.sec04;

public class FloatDoubleExample {

	public static void main (String[] args) {

// 	  실수 데이터타입
/*
	  float 4 byte
	  double : 8 byte
	  정수데이터타입보다는 실수데이터타입의 값의 범위를 확장하기 위해서
	  부동소숫점 방식이라는 형태로 실수값을 저장한다.
	  부동소숫점으로 인해 실수값이 오차가 존재한다.
	  대표적인 경우가 0.1+ 0.2 = 0.3000000000000004
	  0.1이 부동소수점 방식으로 저장되기 떄문에, 온전히 0.1로 저장되지가 않는다.
	  대안 라이브러리를 이용하여, 각 안에서는 작업을 한다.
	  부호비트 + 지수비트 + 가수비트로 저장방식을 사용한다.
 */
		// 정밀도 확인
		// 더블형의 경우 뒤의 d표기를 하지 않아도 된다.
		// float 타입의 경우에는 필수적으로 f 를 적어주어야한다.
		float var1 = 0.1234567890123456789f;
		double var2 = 0.1234567890123456789d;
		double var3 = 3e6D; // 3x10^6
		float var4 = 3e6F; // 3x10^6
		double var5 = 2e-3; // 2x-10^3
		
		System.out.println("var1 :" + var1);
		System.out.println("var2 :" + var2);
		System.out.println("var3 :" + var3);
		System.out.println("var4 :" + var4);
		System.out.println("var5 :" + var5);
		
		
	}
}
