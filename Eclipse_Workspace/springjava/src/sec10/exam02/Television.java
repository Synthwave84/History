package sec10.exam02;

public class Television {
//	정적 블럭 { ... } : 정적필드를 초기화 하는 작업에 사용
	static String company = "My Company";
	static String model = "LCD";
	static String info;
	
//	System.out.println() > 다음과 같은 위치는 호출, 제어 반복문 등 사용 불가.	
	
//	String color = "빠져들듯한 블랙";
	// 정적블럭 :정적 멤버필드를 초기화 작업. 
//	정적 멤버필드가 메모리가 생성된 후, 자동 호출되는 특징이 있다.
//	{}블럭 : 제어문,반복문, 실행문장을 사용 할 수가 있다.
//	즉 중괄호가 쳐져서 블로스코프로 규정을 해 놓아야 거기서 사용이 가능하다.
	static {
		info = company + "-" + model;
		System.out.println("정적 블록 호출 :");
	}
//	현재 클래스에 인스턴스 멤버가 존재할 경우에 객체생성구문을 통하여 참조하게 한다.
//	그럴 일이 없다면, 하단의 코드는 작성해선 안된다.
	Television () {
		company = "";
	}
	
	
}
