package ch14.sec08.exam02;

//	스레드 우선순위 . 1~1범위.
//	: 스레드를 생성 할 때마다,JVM이 자동으로 스레드 우선순위를 할당된다. 기본값 5 
//	우선순위 상수 : MAX_PRIORITY(10), MIN_PRIORITY (1), NORM_PRIORITY (5)


public class PriorityThreadMain extends Thread {

		@Override
		public void run() {
			System.out.println("Inside Run Method");
			
		}
	
	public static void main(String[] args) {
		PriorityThreadMain t1 = new PriorityThreadMain();
		PriorityThreadMain t2 = new PriorityThreadMain();
		PriorityThreadMain t3 = new PriorityThreadMain();
		
//		우선순위 기본값 = 5
		System.out.println("t1스레드 우선순위 :" + t1.getPriority());
		System.out.println("t2스레드 우선순위 :" + t2.getPriority());
		System.out.println("t3스레드 우선순위 :" + t3.getPriority());
		
//		우선순위 변경
		t1.setPriority(2);
		t2.setPriority(5);
		t3.setPriority(8);
		
//		우선순위 2, 5 , 8
		System.out.println("t1스레드 우선순위 :" + t1.getPriority());
		System.out.println("t2스레드 우선순위 :" + t2.getPriority());
		System.out.println("t3스레드 우선순위 :" + t3.getPriority());
		
//		main 스레드 우선순위
		System.out.println("main 스레드 우선순위 : " + Thread.currentThread().getPriority());
		
//		main 스레드 우선순위 변경
		Thread.currentThread().setPriority(MAX_PRIORITY);
		
//		main 스레드 우선순위 확인
		System.out.println("main 스레드 우선순위 : " + Thread.currentThread().getPriority());
	}

}
