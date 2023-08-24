package ch02.sec05;

public class BooleanExample {

	public static void main(String[] args) {
		
		// boolean데이터 타입 true or false
		boolean stop = true;
		if(stop) {
			System.out.println("중지");
		}else {
			System.out.println("시작");
		}
		int x = 10;
		boolean result1 = (x == 20);
		boolean result2 = (x != 20);
			System.out.println("result 1 : " + result1);
			System.out.println("result 2: " + result2);
	}
}
