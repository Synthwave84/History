package ch14.sec06.exam01_3;

public class SynchronizedExample {
	public static void main(String[] args) {
//		공유객체
		Calculator calculator = new Calculator();
		
		User1Thread user1Thread = new User1Thread();
//		100번 전달
		user1Thread.setCalculator(calculator);
//		run() 메소드 호출 (100 변경)
		user1Thread.start();
		User2Thread user2Thread = new User2Thread();
//		100번 전달
		user2Thread.setCalculator(calculator);
//		run() 메소드 호출(50 변경)
		user2Thread.start();
	}
}
