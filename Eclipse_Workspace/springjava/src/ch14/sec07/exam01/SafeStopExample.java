package ch14.sec07.exam01;

public class SafeStopExample {
	public static void main(String[] args) {
//		쓰레드 객체 생성
		PrintThread printThread = new PrintThread();
		printThread.start();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			
		}
		
		printThread.setStop(true);
	}
}
