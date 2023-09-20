package ch14.sec05.exam03;

public class YieldExample {
	public static void main(String[] args) {
//		New  상태
		WorkThread workThreadA = new WorkThread("WorkThreadA");
		WorkThread workThreadB = new WorkThread("WorkThreadB");
		
		workThreadA.start();
		workThreadB.start();
		
//		5초간 main 스레드 정지.
		try {Thread.sleep(5000);} catch (InterruptedException e) {}
		workThreadA.work = false;
		
		try {Thread.sleep(5000);} catch (InterruptedException e) {}
		workThreadA.work = true;
	}
}
