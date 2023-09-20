package ch14.sec03.exam02;

import java.awt.Toolkit;

//	작업자 스레드 추가
public class BeepPrintExample {
	public static void main(String[] args) {
//		작업자 스레드 생성방법 1
		Thread thread = new Thread(new Runnable() {
			
			@Override
			public void run() {
				
//			독립적 실행하고자 하는 작업의 코드 
				Toolkit toolkit = Toolkit.getDefaultToolkit();
				for(int i=0; i<5; i++) {
					toolkit.beep();
//					0.5초간 일시 정지
					try { Thread.sleep(500);} catch(Exception e) {}
				}
			}
		});
//		내부적으로 run() 메소드가 동작한다.
		thread.start();
//		상단의 작업으로 main 메소드로 부터 독립적인 스레드로 분리된다.
//		띵 문자 출력
		for(int i=0; i<5; i++) {
			System.out.println("띵");
//			0.5초 일시정지 하는 기능
			try { Thread.sleep(500);} catch(Exception e) {}
		}
		
		
		
	}
}
