package ch14.sec03.exam03;

import java.awt.Toolkit;

public class BeepPrintExample {
	public static void main(String[] args) {
//		작업자 스레드 생성.방법 2
		Thread thread = new Thread() {
			@Override
			public void run() {
				Toolkit toolkit = Toolkit.getDefaultToolkit();
//				띵 사운드 출력
				for(int i=0; i<5; i++) {
					toolkit.beep();
//					0.5초간 일시 정지
					try { Thread.sleep(500);} catch(Exception e) {}
				}
			}
		};
		thread.start();
		
		for(int i=0; i<5; i++) {
			System.out.println("띵");
//			0.5초 일시정지 하는 기능
			try { Thread.sleep(500);} catch(Exception e) {}
		}
		
	}
}
