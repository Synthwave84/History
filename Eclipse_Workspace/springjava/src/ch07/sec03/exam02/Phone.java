package ch07.sec03.exam02;

public class Phone {
//	필드선언
	public String model;
	public String color;
	
//	매개변수를 갖는 생성자 선언 
//	기본 생성자는 생성되지 않는다. 매개변수가 있기 때문.
	public Phone(String model, String color) {
		this.model= model;
		this.color=color;
		System.out.println("Phone(String model, String color) 생성자 실행");
	}
	
}
