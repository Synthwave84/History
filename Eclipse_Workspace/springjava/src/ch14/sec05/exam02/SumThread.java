package ch14.sec05.exam02;

//	현재 클래스를 스레드 작업으로 사용
public class SumThread extends Thread {
	private long sum;
	public long getSum() {
		return sum;
	}
	
	public void setSum(long sum) {
		this.sum = sum;
	}
	
	@Override
//	1~100까지의 합
	public void run() {
		for(int i=1; i<=100; i++) {
			sum +=i;
		}
		
	}
}
