package ch08.sec08;

public class MultiInterfaceImpExample {
	public static void main(String[] args) {
		
//		3개의 메소드 전부 접근가능
//		SmartTelevision st = new SmartTelevision();
		
		
		
		RemoteControl rc = new SmartTelevision();
//		RemoteControl 인터페이스에 선언된 추상 메소드로 재정의된 메소드만
//		호출 할 수 있다.
		rc.turnOn();
		rc.turnOff();
//		rc.search(); 사용불능
		
		
		Searchable searchable = new SmartTelevision();
		searchable.search("http://www.youtube.com");
//		searchable.turnOn(); 사용불가
//		searchable.turnOff(); 사용불가
		
		
		
	}
	
		
}
