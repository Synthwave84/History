package ch14.sec06.exam01_2;

public class SynchronizedExample {
	public static void main(String[] args) {
//		Th1 = calc1 / Th2 = calc2를 사용
//		100 번지
		Calculator calculator1 = new Calculator();
//		200 번지
		Calculator calculator2 = new Calculator();
		
		User1Thread user1Thread = new User1Thread();
//		100번 전달
		user1Thread.setCalculator(calculator1);
//		run() 메소드 호출 (100 변경)
		user1Thread.start();
		User2Thread user2Thread = new User2Thread();
//		100번 전달
		user2Thread.setCalculator(calculator2);
//		run() 메소드 호출(50 변경)
		user2Thread.start();
	}
}
