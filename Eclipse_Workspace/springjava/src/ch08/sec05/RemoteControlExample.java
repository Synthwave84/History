package ch08.sec05;

public class RemoteControlExample {
	public static void main(String[] args) {
		RemoteControl rc;
		
		// TV객체를 생성하고 인터페이스 대입. 다형성
		rc = new Television();
		rc.turnOn();
		rc.setVolume(5);
	
		
		// 디폴트 메소드 호출
		rc.setMute(true);
		rc.setMute(false);
		// Audio 객체를 생성하고 인터페이스 대입. 다형성
		rc = new Audio();
		rc.turnOn();
		rc.setVolume(245);

		
//		디폴트 메소드 호출
		rc.setMute(true);
		rc.setMute(false);
		rc.turnOff();
		
	}
}
