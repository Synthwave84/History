package ch08.sec02;

//  클래스가 인터페이스를 상속받는 경우. implements를 사용한다
//  인터페이스의 추상메소드를 상속받는 클래스는 반드시 구현(재정의) 해야한다.
public class Audio implements RemoteControl{

	
	@Override
	public void turnOn() { 
			System.out.println("Audio 켭니다.");
	}
}
