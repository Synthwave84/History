package ch08.sec05;

public interface RemoteControl {

//		상수필드
		int MAX_VOLUME = 10;
		int MIN_VOLUME= 0;

//		추상 메소드
		void turnOn();
		void turnOff();
		void setVolume (int volume);
		
//		일반 메소드는 사용 할 수 없으나, default를 선언하면 사용 할 수있다.
//		디폴트 인스턴스 메소드
		default void setMute(boolean mute) {
			if(mute) {
				System.out.println("무음 처리합니다.");
				setVolume(MIN_VOLUME);
			}else {
				System.out.println("무음처리가 해제되었습니다.");
			}
		} 
}
