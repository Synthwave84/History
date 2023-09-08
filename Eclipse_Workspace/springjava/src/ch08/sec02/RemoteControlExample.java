package ch08.sec02;

public class RemoteControlExample {
	public static void main(String[] args) {
		
		
//		객체생성 불가능
//		RemoteControl remoteControl= new RemoteControl();
		RemoteControl rc;
		rc= new Television();
		rc.turnOn(); // Television 구현 메소드 호출
		
		rc = new Audio();
		rc.turnOn(); // Audio 구현 메소드 호출.
	}
}
