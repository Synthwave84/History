package ch05.sec05;

public class CharAtExample {
	public static void main(String[] args) {
//		문자열 추출
		String ssn = "123456-1234567";

	 	char gender = ssn.charAt(7);
	 	switch(gender) {
//		char 데이터 타입은 작은 따옴표!!!!!!!!!!!!!!!!!!!!!
	 		case '1' :
	 		case '3' :
	 			System.out.println("남자입니다.");
	 			break;
	 		case '2' :
	 		case '4' : 
	 			System.out.println("여자입니다.");
	 			break;
	 	}
	}
}
