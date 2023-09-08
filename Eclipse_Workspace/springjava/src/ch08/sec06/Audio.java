package ch08.sec06;

public class Audio implements RemoteControl {
	
	
//	필드
//	 현재 오디오 볼륨 상태를 저장하는 변수
	private int volume;
	
//	인터페이스를 상속 받은 클래스는 인터페이스의 추상 메소드를 구현해야 하는
//	문법적인 규칙때문에, 하단의 작업을 틀에서 제공해 주고 있다.
	
	@Override
	public void turnOn() {
		System.out.println("오디오를 켭니다.");

	}

	@Override
	public void turnOff() {
		System.out.println("오디오를끕 니다");

	}

	@Override
	public void setVolume(int volume) {
//		볼륨 최대 1, 최소 0
		if(volume> RemoteControl.MAX_VOLUME) {
			volume= RemoteControl.MAX_VOLUME;
		} else if (volume < RemoteControl.MIN_VOLUME) {
			this.volume= RemoteControl.MIN_VOLUME;
		}else {
			this.volume = volume;
		}
		System.out.println("현재 AUDIO 뵬룸샹태 : " + volume);
	}

//	필드
	private int memoryVolume;
	@Override
		public void setMute(boolean mute) {
		if(mute) {
			this.memoryVolume = this.volume;
					System.out.println("무음처리합니다.");
					setVolume(this.MIN_VOLUME);
		}else {
			System.out.println("무음 해제 합니다.");
			setVolume(this.memoryVolume);
		}
			
		}
}
