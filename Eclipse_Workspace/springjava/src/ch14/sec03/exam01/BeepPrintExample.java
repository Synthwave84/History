package ch14.sec03.exam01;

import java.awt.Toolkit;

//	스레드 : 프로그램에서 독립적으로 실행하는 단위.
//	하나의 프로그램은 기본적으로 1개의 스레드를 제공.
//	기본 스레드 이름: main 스레드
//	프로그램이 실행을 할 때에 JVM이 main 스레드를 생성. 및 동작시키고,
//	main 스레드가 담당하는 main()메소드를 실행시킨다.
//	기본스레드 main스레드 하에서 실행중인 main 메소드의 실행순서는 작성된 코드
//	즉, 위에서 아래로 순차적으로 실행되는 특징이 있다.

public class BeepPrintExample {
	public static void main(String[] args) {
		Toolkit toolkit = Toolkit.getDefaultToolkit();
//			띵 사운드 출력
			for(int i=0; i<5; i++) {
				toolkit.beep();
//				0.5초간 일시 정지
				try { Thread.sleep(500);} catch(Exception e) {}
			}
			
//			띵 문자 출력
			for(int i=0; i<5; i++) {
				toolkit.beep();
				System.out.println("띵");
//				0.5초 일시정지 하는 기능
				try { Thread.sleep(500);} catch(Exception e) {}
			}


			
			
			
	}
}
