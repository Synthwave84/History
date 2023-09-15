package ch13.sec02.exam03;


public class GenericExample {
	public static void main(String[] args) {
//		 제네릭 없이 객체 생성. Object클래스로 타입생성
		Box box1 = new Box();
//		Object
		box1.content = "100"; 
		
		Box box2 = new Box();
//		Object
		box2.content = "100";
		
		Box box3 = new Box();
//		Object
		box2.content = "100";
		
		boolean result1 = box1.compare(box2);
		System.out.println("result1: " + result1);
		
		boolean result2 = box1.compare(box2);
		System.out.println("result2: " + result2);
	}
}
