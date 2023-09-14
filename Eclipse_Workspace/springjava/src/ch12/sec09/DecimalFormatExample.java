package ch12.sec09;

import java.text.DecimalFormat;

// 형식클래스
public class DecimalFormatExample {

	public static void main(String[] args) {
		double num = 1234567.89;
		
		DecimalFormat df;
		// 정수 자리까지 표기. (소수부분을 제거)
		df = new DecimalFormat("#,###");
		System.out.println(df.format(num)); // 1,234,568 반올림처리됨.

		// 무조건 소수 첫째 자리까지 표기.
		df = new DecimalFormat("#,###.0");
		System.out.println(df.format(num)); // 1,234,567.9 반올림처리됨.
		
	}

}