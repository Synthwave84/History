package ch06.sec10.exam01;

public class Calculator {
//	메인 메소드가 시작 될 때 메소드 영역에 정적(static)멤버의 기억장소가 생성된다.
//	단 1번만 메소드 영역에 기억장소가 생성된다.
//	공유 목적으로 생성.
	
	static double pi = 3.1415;
	static int plus( int x, int y) {
		return x+y;
	}
	static int minus (int x, int y) {
		return x-y;
	}
	
}
