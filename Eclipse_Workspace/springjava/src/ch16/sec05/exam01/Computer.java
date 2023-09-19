package ch16.sec05.exam01;

//	람다식의 실행문에서 사용하기 위한 용도.
public class Computer {
//	정적 메소드
	public static double staticMethod(double x, double y) {
		return x+ y;
	}
//	인스턴스 메소드
	public double instanceMethod(double x, double y) {
		return x+ y;
	}
}
