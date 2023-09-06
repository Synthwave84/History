package ch07.sec05.exam02;

// 메소드 final 키워드를 사용시 재정의(override)를 할 수 없다.
public class Car {
	
//	필드 선언
	public int speed;
	
//	메소드 선언
	public void speedUp() {
		speed += 1;
	}
	
//	final 메소드
	public final void stop() {
		System.out.println("차를 멈춤");
		speed = 0;
	}
	
	
	
}
