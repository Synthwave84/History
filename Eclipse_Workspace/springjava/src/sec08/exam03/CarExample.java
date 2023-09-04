package sec08.exam03;

public class CarExample {
	public static void main(String[] args) {
//		myCar 객체 생성
		Car myCar = new Car();
		
//		setGas(5)
		myCar.setGas(5);
//		if isLeftGas : gas가 존재시 "출발합니다" run() 메소드 호출
		if (myCar.isLeftGas()) {
			System.out.println("출발합니다");
			 myCar.run();
		}
		System.out.println("Gas를 주입하세요");
		
//		"gas"를 주입하세요. 문구 추가.
		
	}
}
