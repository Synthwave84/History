package ch14.sec08;

public class DaemonExample {
	public static void main(String[] args) {
		AutoSaveThread autoSaveThread = new AutoSaveThread();
//		데몬스레드. 주 스레드가 종료되면, 따라서 함께 종료가 된다.
		autoSaveThread.setDaemon(true); 
		autoSaveThread.start();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			
		}
		System.out.println("메인 스레드 종료");
		
		
		
		
		
	}
}
