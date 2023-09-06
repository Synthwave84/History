package ch07.sec02;

public class SmartPhone extends Phone{

	public boolean wifi;
//	자식생성자 아래에는 부모클래스의 변수값을 가져올 때 super()가 생성된다
//	현재 부모클래스 = Phone. 자식클래스 SmartPhone
	public SmartPhone (String model, String color) {
//		super();
		this.model = model;
		this.color = color;
	}
	
	public void setWifi (boolean wifi) {
		System.out.println("와이파이 상태를 변경합니다");
	}
	
	public void internet() {
		System.out.println("인터넷에 연결됩니다.");
	}
}
