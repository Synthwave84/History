package ch08.sec11.exam01;

public class CarExample {

//	자동차 회사 조립 과정. 필드 다형성
	public static void main(String[] args) {
		

//		자동차 생성
		Car myCar= new Car();

		
//		바퀴 장착 , 형변환, 다형성
		myCar.tire = new HankookTire();
		myCar.run();

//		바퀴장착 , 형변환, 다형성
		myCar.tire = new KumhoTire();
		myCar.run();
	}
}
