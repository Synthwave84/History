package ch02.sec01;

public class Variable03 {

	public static void main(String[] args) {
		//  두 변수의 값을  바꾸는 예제
		int x = 3;
		int y = 5;
		System.out.println("x :" + x + ",y:" +y);
		int temp = x;
		x = y;
		y = temp;
		System.out.println("x :" + x + ",y:" +y);
	}

}
