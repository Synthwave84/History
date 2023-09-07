package ch07.sec08.exam02;

//  운송수단을 선택하여 운전하는 실제 사용 클래스
public class Driver {
	public void drive(Vehicle vehicle) {
		
//		vehicle에 제공되는객체가 bus, taxi 인가에 따라서
//		자식객체의 재정의된 메소드가 호출됨
		vehicle.run();
	}
}
