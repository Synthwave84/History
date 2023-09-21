package ch14.sec08.exam02;

public class Task1 extends Thread{

	@Override
	public void run() {
		System.out.println("작업1 시작");
		for (int i=101; i<=199; i++) {
			System.out.print(i + " ");
		}
		System.out.println("작업1 종료");
	}
	
}
