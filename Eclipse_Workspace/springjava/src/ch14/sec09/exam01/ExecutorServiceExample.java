package ch14.sec09.exam01;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExecutorServiceExample {
	public static void main(String[] args) {

//		스레드 풀 생성 5개
		
//		스레드풀에서 스레드가 사용되지 아니하더라도, 스레드 풀에서
//		스레드를 따로 제거하지 않는다.
		ExecutorService executorService = Executors.newFixedThreadPool(5);

//		스레드 풀의 Que 구조를 갖고있는 장소에 작업이 추가될 때마다, 스레드가 부족하게 되면
//		스레드를 생성하는 추가 생성하여 작업한다.
//		스레드 풀의 스레드가 60초 동안 비 작업 시, 스레드풀에서 제거시킨다.
//		ExecutorService executorService = Executors.newCachedThreadPool();		

//		작업생성 : 작업 클래스

//		처리요청 : 작업생성된 객체를 스레드 풀의 Que(큐)에 등록한다.

//		스레드풀 종료

//		스레드 풀의 현재 작업 또는 Queue에 등록된 작업을 진행하지 않고, 스레드풀 종료
//		현재 작업은 유실됨. Queue에 등록된 진행하지 않은 작업은 나중에 리턴 받을 수 있다.
		executorService.shutdownNow();
//		스레드 풀에 존재하는 모든 작업이 완료 된 이후에 스레드 풀이 종료된다.
//		executorService.shutdown();
	}
}
