package ch14.sec06.exam02;

public class WaitNotifyExample {
	public static void main(String[] args) {
//		1) 작업내용을 가지고 있는 작업에 생성
		WorkObject workObject = new WorkObject();
//		2) 작업내용을 스레드로 관리하는 스래드 객체 생성
		ThreadA threadA = new ThreadA(workObject);
		ThreadB threadB = new ThreadB(workObject);
		
//		workObject.methodA()
		threadA.start();
//		workObject.methodB()
		threadB.start();
	}
}
