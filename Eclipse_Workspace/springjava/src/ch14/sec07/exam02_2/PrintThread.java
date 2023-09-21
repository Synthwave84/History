package ch14.sec07.exam02_2;

public class PrintThread extends Thread{
	@Override
	public void run() {
	
			while(true) {
				System.out.println("실행 중");
				if(Thread.interrupted()) {
					break;
				}
			}  
			System.out.println("예외발생!");
	
		
		System.out.println("리소스정리");
		System.out.println("실행 종료");
	}
}
