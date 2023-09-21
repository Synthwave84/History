package ch14.sec06.exam02;

//	스레드에서 실제로 작업할 작업 내용을 가지고 있는 클래스
public class WorkObject {
	public synchronized void methodA() {
//		현재 실행하고 있는 스레드를 참조.
		Thread thread = Thread.currentThread();
		System.out.println(thread.getName() + ": methodA()  작업 실행");
//		wait으로 일시정지 상태에 있는 스레드를 대기(runnable)상태로 변환
		notify(); 
		try {
//				 현재 ㅣㄹ행 스레드를 일시정지 상태로 변경
				wait();
		}catch (InterruptedException e) {}
	}
	
	public synchronized void methodB () {
//		현재 실행하고 있는 스레드를 참조.
		Thread thread = Thread.currentThread();
		System.out.println(thread.getName() + ": methodB()  작업 실행");
//		wait으로 일시정지 상태에 있는 스레드를 대기(runnable)상태로 변환
		notify(); 
		try {
//				현재 실행 스레드를 일시정지 상태로 변경
				wait();
		}catch (InterruptedException e) {}
	} 
	
}
