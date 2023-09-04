package sec10.exam02;

public class Television {
//	정적 블럭 { ... } : 정적필드를 초기화 하는 작업에 사용
	static String company = "My Company";
	static String model = "LCD";
	static String info;
	
	// 정적블럭 :정적 멤버필드를 초기화 작업
	static {
		info = company + "-" + model;
	}
	
	
}
