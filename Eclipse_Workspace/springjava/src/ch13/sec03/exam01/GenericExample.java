package ch13.sec03.exam01;

public class GenericExample {
	
//	제네릭 메소드
//	<T> 리턴타입 메서드명(T 매개변수);
	public static <T> Box<T> boxing(T t){
		Box<T> box = new Box<T>();
		box.set(t);
		return box;
	}
	
//	Box 클래스 멤버타입 Integer
//	public static <Integer> Box<Integer> boxing(Integer t){
//		Box<Integer> box = new Box<Integer>();
//		box.set(t);
//		return box;
//	}
	
//	Box 클래스 멤버타입 String
//	public static <String> Box<String> boxing(String t){
//	Box<String> box = new Box<String>();
//	box.set(t);
//	return box;
//}
	
	public static void main(String[] args) {
//		제너릭 메소드 호출
//		Box<Integer> boxing(Integer t)
		Box<Integer> box1 = boxing(100);
		int intValue = box1.get();
		System.out.println(intValue);
//		Box<String> boxing(String t)
		Box<String> box2 = boxing("안녕");
		String strValue = box2.get();
		System.out.println(strValue);
	}
}
