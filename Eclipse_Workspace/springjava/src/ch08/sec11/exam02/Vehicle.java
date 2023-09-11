package ch08.sec11.exam02;

//	상위클래스(부모) : 운송수단
public interface Vehicle {
	
//	메소드 선언
	
	default void run() {
		System.out.println("차량이 달립니다.");
	}
}
