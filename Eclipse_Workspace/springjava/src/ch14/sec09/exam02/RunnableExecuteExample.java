package ch14.sec09.exam02;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class RunnableExecuteExample {
	public static void main(String[] args) {
		
//		작업준비내용
		String[][] mails = new String[1000][3];
		for(int i=0; i<mails.length; i++) {
			mails[i][0] = "admin@my.com";
			mails[i][1] = "user" + i + "@my.com";
			mails[i][2] = "신상품 입고";
		}
		
//		1) 스레드 풀 생성
		ExecutorService executorService = Executors.newFixedThreadPool(5);
		
//		2) 작업 생성 및 처리 요청(스레드 풀의 작업 큐(Queue)에 등록)
		for(int i=0; i<1000; i++) {
//			jdk 1.8부터는 final 생략을 해도 된다.
			final int idx = i;
//			익명 구현 객체 = Runnable() > 리턴 값이 없을 때.
//			지역변수가 익명객체안에서 사용 시 값의 변경이 불가능한 문법규칙이 존재한다.
			executorService.execute(new Runnable() {
				
				@Override
				public void run() {
//					현재 run메소드의 내용을 실행하는 스레드 풀의 스레드를 참조하는 의미.
					Thread thread = Thread.currentThread();
					String from = mails[idx][0];
					String to = mails[idx][1];
					String content = mails[idx][2];
					System.out.println("["+ thread.getName()+ "]" + from + "==>" + to + ":" + content);
				}
			});
		}
//		스레드 풀 종료
		executorService.shutdown();
		
		
	}
}	
