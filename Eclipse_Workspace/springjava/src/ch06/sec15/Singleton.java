package ch06.sec15;


//  디자인패턴 싱글톤
// 싱글톤 : 클래스를 이용하여 단 하나의 객체만 생성하는 목적.
public class Singleton {
	
//	객체를 내부 생성
	private static Singleton singleton = new Singleton();
	
//	생성자
	private Singleton () {}
	
//	싱글톤 예제를 할때는 getInstance라고 만드는게 좋다.
//	
	public static Singleton getInstance() {
		return singleton;
	}
	
	
}
