package ch14.sec05.exam02;

public class JoinExample {
	public static void main(String[] args) {
//		스레드상태 : New
		SumThread sumThread = new SumThread();
//		스레드 상태 : Runnable(대기).
//		CPU 스케쥴링에 의해, CPU점유를 받아 실행.
		sumThread.start();
//		main 스레드가 일시 정지상태가 된다.
//		sumThread가 동작이 완료 되면, main 스레드는 대기 상태로 가게된다.
//		즉 실행할 수 있는 후보가 된다.(Runnable)
		try {
			sumThread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("1~100합 :" + sumThread.getSum());
	}
}
