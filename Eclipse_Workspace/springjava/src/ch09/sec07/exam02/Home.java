package ch09.sec07.exam02;

// 인터페이스를 익명구현 객체 사용(상속 대신 직접 사용). 
public class Home {

//	1) 인터페이스 및 추상 메서드는 객체생성 불가
//	RemoteControl rc = new RemoteControl();
	
	
//	2) 필드에 익명구현객체 대입
	private RemoteControl rc = new RemoteControl() {
		
		@Override
		public void turnOn() {
			// TODO Auto-generated method stub
			System.out.println("tv를 켭니다");
		}
		
		@Override
		public void turnOff() {
			// TODO Auto-generated method stub
			System.out.println("tv를 끕니다");
		}
	};
	
	public void use1() {
	rc.turnOn();
	rc.turnOff();
	}
	
//	메소드 ( 로컬변수 이용)
	public void use2() {
		RemoteControl rc = new RemoteControl() {
			
			@Override
			public void turnOn() {
				
				System.out.println("에어컨을 킵니다.");
			}
			
			@Override
			public void turnOff() {
				
				System.out.println("에어컨을 끕니다.");
			}
		};
		rc.turnOn();
		rc.turnOff();
		
	}
	
	public void use3(RemoteControl rc) {
		rc.turnOn();
		rc.turnOff();
	}
}
