package ch08.sec10.exam02;

public class CastingExam {
	public static void main(String[] args) {
		Vehicle vehicle = new Bus();
//		인터페이스 변수를 통하여 호출
		vehicle.run(); 
//		vehicle.checkFare(); 호출 불가
		
//		강제 타입 변환 후 호출.
		Bus bus =(Bus) vehicle;
		bus.run();
		bus.checkFare();
	}
}
