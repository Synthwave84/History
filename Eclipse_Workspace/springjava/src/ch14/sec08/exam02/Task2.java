package ch14.sec08.exam02;

public class Task2 implements Runnable{
	@Override
	public void run() {
		System.out.println("작업2 시작");
		for (int i=201; i<=299; i++) {
			System.out.print(i + " ");
		}
		System.out.println("작업2 종료");
	}
}
