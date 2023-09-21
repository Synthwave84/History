package ch14.sec08.exam02;

//	우선순위 설정은 단지 추천 순위 정도이다.
//	우선순위를 높게 설정한다고 해서, 항상 먼저 실행 하는 것은 아니다.


public class TaskThreadMain {
	public static void main(String[] args) {
//		101~199
		Task1 task1= new Task1();
		task1.start();
//		201~299
		Task2 task2 = new Task2();
		Thread threadTask2= new Thread(task2);
		
		threadTask2.start();
//		301~399
		for (int i=301; i<=399; i++) {
			System.out.print(i + " ");
		}
		System.out.println("작업 3 종료");
	}
}
