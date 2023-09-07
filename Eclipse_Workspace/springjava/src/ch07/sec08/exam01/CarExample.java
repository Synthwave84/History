package ch07.sec08.exam01;

public class CarExample {

	public static void main(String[] args) {
		

//		자동차 생성
		Car myCar= new Car();
		myCar.tire = new Tire();
		myCar.run();

		
//		바퀴 장착
		myCar.tire = new HankookTire();
		myCar.run();

//		... 타이어 변경사항 
		myCar.tire = new KumhoTire();
		myCar.run();
	}
}
