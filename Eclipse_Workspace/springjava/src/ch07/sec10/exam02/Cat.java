package ch07.sec10.exam02;


// 추상메소드가 있는 추상클래스를 상속 받는 경우, 자식클래스는 추상 메소드를
// 반드시 재정의 해야한다.123
public class Cat extends Animal{
	
	@Override
	void sound() {
		System.out.println("야옹");
	}
}
