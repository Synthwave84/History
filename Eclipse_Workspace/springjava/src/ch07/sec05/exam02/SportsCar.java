package ch07.sec05.exam02;

public class SportsCar extends Car {

	@Override
	public void speedUp() {
		speed += 10;
	}
//	stop()메소드는 재정의가 불가능하다. 부모클래스에서 final로 선언되어있기 때문이다.
	/*
	@Override
	public void stop() {
		System.out.println("스포츠카륾 ㅓㅁ춤")
		speed=0;
	}
	*/
}
