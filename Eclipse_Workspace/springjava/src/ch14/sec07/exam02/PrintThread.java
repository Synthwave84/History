package ch14.sec07.exam02;

public class PrintThread extends Thread{
	@Override
	public void run() {
		try {
			while(true) {
				System.out.println("실행 중");
				Thread.sleep(1);
			}
		} catch (InterruptedException e) {
			System.out.println("예외발생!");
	
		}
		System.out.println("리소스정리");
		System.out.println("실행 종료");
	}
}
