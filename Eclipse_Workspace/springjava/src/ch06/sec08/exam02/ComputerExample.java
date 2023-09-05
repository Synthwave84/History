package ch06.sec08.exam02;

public class ComputerExample {
	public static void main(String[] args) {
//		객체 myCom
		Computer myCom = new Computer();
		
		int result1 = myCom.sum(1, 2, 3);
		System.out.println("result1 : " + result1);
		int result2 = myCom.sum(1, 2, 3, 4, 5);
		System.out.println("result2 : " + result2);
		
		int [] values = {1, 2, 3, 4, 5};
//		매개변수를 배열로도 사용 할 수 있다.
		int result3 = myCom.sum(values);
		System.out.println("result3 : " + result3);
		
		int result4 = myCom.sum(new int [] {1, 2, 3, 4, 5}); 
		System.out.println("result4 : " + result4);
		
		
	}
}
