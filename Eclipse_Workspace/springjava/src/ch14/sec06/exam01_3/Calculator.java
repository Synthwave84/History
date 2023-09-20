package ch14.sec06.exam01_3;

//	공유자원이 있는 클래스 용도.
public class Calculator {
	private int memory;
	public int getMemory() {
		return memory;
	}
	
	public synchronized void setMemory1(int memory) {
		this.memory = memory;
		
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {}
		
		System.out.println(Thread.currentThread().getName()+":" + this.memory);
		
	}
	
	public void setMemory2(int memory) {
//		동기화 블록이 아닌 코드
		
//		동기화 블록
		synchronized (this) {
			this.memory = memory;
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {}
			
			System.out.println(Thread.currentThread().getName()+":" + this.memory);
		}
		
		
	}
	
	
	
}
