package ch08.sec02;



// 인터페이스는 상속 목적으로 설꼐. 추상클래스도 동일하다. 
// new를 이용한 객체 생성작업은 불가능하다.
public interface RemoteControl {

	
	// 일반 메소드 선언 불가능
//	public void turnOn() {
//	system.out.printLn("출발")
//	};
	
	// 추상 메소드
	// 컴파일 작업 public abstract void turnOn();
	public void turnOn() ;
	
}
