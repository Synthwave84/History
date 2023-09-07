package ch07.sec10.exam01;

public class PhoneExample {
	public static void main(String[] args) {
//		추상클래스는 객체생성이 불가능하다	(abstract)
//		Phone phone = new Phone("길동이");
		
		SmartPhone smartPhone = new SmartPhone("길동이");
		
		smartPhone.turnOn();
		smartPhone.internetSearch();
		smartPhone.turnOff();
		
	}
}
