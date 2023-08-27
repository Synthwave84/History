package ch02.sec09;

public class StringConcatExample {
public static void main(String[] args) {
	// 문자열 연결 연산자 : +
	// 숫자가 문자열을 +로 만나게 되면 문자열로 변환된다!
	
	int result1 = 10 + 2 + 8;
	System.out.println("result1 : " + result1);
//	결합연산 : 숫자와 문자열 둘이 연산시 결과는 String이 되야 한다.
	String result2 = 10+ 2 +"8";  // 12 + "8"
	System.out.println("result2 : " +result2);
	
	 String result3 = 10 +"2" +8; // 10+ "2" + 8 = 1028
	 System.out.println("result3 : " + result3);
	
	 String result4 = "10" + 2 + 8;
	 System.out.println("result4 : " + result4);
	 
	 String result5 = "10" +  (2+8);
	 System.out.println("result5 : " +result5);
	
//	 string result6 = "10" -10; // 에러~ 왜냐면 문장끼리 더할떄 + 를 쓰기도 하기때문. - 는 무조건연산자
	}
}
