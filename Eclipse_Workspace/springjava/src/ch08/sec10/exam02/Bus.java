package ch08.sec10.exam02;

public class Bus implements Vehicle {
	@Override
	public void run() {
	System.out.println("달린다!");	
	}
	
//	추가 메서ㅗ드
	public void checkFare() {
		System.out.println("승차요금 체크합니다");
	}
	
	
}
