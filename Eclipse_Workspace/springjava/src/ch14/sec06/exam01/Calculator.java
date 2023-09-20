package ch14.sec06.exam01;

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
	
	
	
}
