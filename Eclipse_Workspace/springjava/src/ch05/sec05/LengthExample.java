package ch05.sec05;

public class LengthExample {
	public static void main(String[] args) {
//		문자열 길이
		String ssn = "1234567123456"; // 13자리
		int length = ssn.length();
		if(length == 13) {
			System.out.println("주민등록 번호 자릿수가 맞습니다.");
		}else {
			System.out.println("주민등록 번호 자릿수가 맞지 않습니다");
		}
	}
}
