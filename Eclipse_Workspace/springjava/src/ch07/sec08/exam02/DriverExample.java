package ch07.sec08.exam02;

public class DriverExample {
	public static void main(String[] args) {
		
		Driver driver = new Driver();
		
		// 버스 선택하기
		Bus bus = new Bus();
		driver.drive(bus);
		// 택시 선택하기
		Taxi taxi = new Taxi();
		driver.drive(taxi);
		
		Bycle bycle = new Bycle();
		driver.drive(bycle);
		
	}
}
