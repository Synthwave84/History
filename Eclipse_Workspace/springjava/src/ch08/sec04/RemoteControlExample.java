package ch08.sec04;

public class RemoteControlExample {
	public static void main(String[] args) {
		RemoteControl rc;
		
		// TV객체를 생성하고 인터페이스 대입. 다형성
		rc = new Television();
		rc.turnOn();
		rc.setVolume(5);
		rc.turnOff();
		
		// Audio 객체를 생성하고 인터페이스 대입. 다형성
		rc = new Audio();
		rc.turnOn();
		rc.setVolume(10);
		rc.turnOff();
	}
}
