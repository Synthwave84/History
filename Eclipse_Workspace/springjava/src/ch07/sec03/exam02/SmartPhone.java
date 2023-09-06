package ch07.sec03.exam02;

public class SmartPhone extends Phone {

//		부모클래스에 기본 생성자가 존재하지 않기 때문에(매개변수생성자)
//		super();가 작동 하지 않는다. 왜냐하면 기본 생성자가 없기 때문에.
		public SmartPhone(String model, String color) {
//		부모클래스의 기본 생성자가 없으므로, 매개변수가 있는 부모클래스의
//		생성자를 호출한다.
	    super("아이폰25", "은색");
			System.out.println("public SmartPhone(String model, String color) 생성자 실행");
		}
}
