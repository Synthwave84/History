package ch14.sec05.exam03;

//	스레드로 사용할 예제
public class WorkThread extends Thread{

//	필드
	public boolean work = true;
	
//	생성자 
	public WorkThread (String name) {
//		스레드명 정의 필드
		setName(name);
	}

	@Override
	public void run() {
		while(true) {
			if(work) {
				System.out.println(getName() + " : 작업처리");
			}else {
//				자신의 스레드는 대기상태가 되고, 스레드의 CPU점유를 다른 스레드에 양보.
				Thread.yield();
			}
		}
	}
	
}
