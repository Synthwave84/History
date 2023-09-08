package ch08.sec03;

public class RemoteControlExample implements RemoteControl {
	public static void main(String[] args) {
//		인터페이스의 상수를 사용
		System.out.println("리모콘 최대 볼륨 : " + RemoteControl.MAX_VOLUME);
		System.out.println("리모콘 최저 볼륨 : " + RemoteControl.MIN_VOLUME);
	}
}
