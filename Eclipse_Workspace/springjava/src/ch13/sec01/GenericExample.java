package ch13.sec01;

public class GenericExample {
	public static void main(String[] args) {
		
		Box<String> box1 = new Box<String>();
		box1.content = "하이요";
		String str = box1.content;
		System.out.println(str);
		
		Box<Integer> box2 = new Box<Integer>();
		box2.content = 100;
		int value = box2.content;
		System.out.println(value);
		
	}
}
