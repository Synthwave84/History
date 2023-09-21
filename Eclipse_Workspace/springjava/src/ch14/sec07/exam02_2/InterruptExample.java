package ch14.sec07.exam02_2;

public class InterruptExample {
	public static void main(String[] args) {
//		PrintThread thread = new PrintThread();
		Thread thread = new PrintThread();
		thread.start();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) { }
//		thread 객체가 관리하는 스레드에서 sleep()  메소드에 의한 일시정지
//		아래 코드가 호출 시 예외를 발생시킨다. 
		thread.interrupt();
	}
}	
