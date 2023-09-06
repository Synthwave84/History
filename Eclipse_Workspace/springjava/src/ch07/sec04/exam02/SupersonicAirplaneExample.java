package ch07.sec04.exam02;

public class SupersonicAirplaneExample {
	public static void main(String[] args) {
		
		SupersonicAirlpane sa = new SupersonicAirlpane();
		sa.takeOff();
		sa.fly();
//		자식클래스의 fly 메소드를 호출하는데, 그 안에서 super.fly()호출.
		sa.flyMode = SupersonicAirlpane.SUPERSONIC;
		sa.fly();
		sa.flyMode = SupersonicAirlpane.NORMAL;
		sa.fly();
		sa.land();
	}
}
