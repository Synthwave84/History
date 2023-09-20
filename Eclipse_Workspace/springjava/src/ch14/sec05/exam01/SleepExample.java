package ch14.sec05.exam01;

import java.awt.Toolkit;

//	스레드상태  일시 정지
public class SleepExample {
	
	public static void main(String[] args) {
		
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		for(int i=0; i<10; i++) {
			toolkit.beep();
//			3 초간 일시정지
			try {
//				3초 후에 스레드는 대기(runnable) 상태로 전환된다
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			} 
		}
		
		
		
		
	}
	
		
}
