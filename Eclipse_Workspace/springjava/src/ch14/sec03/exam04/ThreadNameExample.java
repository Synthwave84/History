package ch14.sec03.exam04;

//	작업자 스레드 이름 : Thread-n 예시 > Thread-0 -1 -2 ...
//	작업자 스레드 이름 정의하기.
		
public class ThreadNameExample {
	public static void main(String[] args) {
//		현재 실행중인 스레드를 참조.
		Thread mainThread = Thread.currentThread();
		System.out.println(mainThread.getName()+"실행");
		
//		Thread의 기본 이름
		for(int i=0; i<3; i++) {
			Thread threadA = new Thread() {
				@Override
				public void run() {
					System.out.println(getName()+ "실행");
				}
			};
//			스레드 상태: start()메소드가 실행되기 전까지 스레드 상태를
//			New 라고 한다.
			
			
//			실행이 되면, 스레드는 스레드 상태가 대기 상태로 존재한다.
//			run메소드가 즉시 호출이 되진 않는다.
			threadA.start();
		}
		
//		스레드 기본 이름 정하기
		Thread chatThread = new Thread() {
			@Override
			public void run() {
				System.out.println(getName() + "실행");
			}
		};
		chatThread.setName("chatThread");
		chatThread.start();
		
		
		
	}
}
