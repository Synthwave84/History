package sec09;

public class Car {
//	클래스를 정의할때, 인스턴스 멤버예제
//	클래스 구성요소인 멤버는 2가지로 구분 된다.
//	1. 인스턴스 멤버 , 2. Static 멤버 (정적)멤버로 구분된다.
//	!! 메모리 생성과 관련이 있다 !! *****
	
//	필드 선언
//		static을 앞에 선언할때 달 수 있꼬 달지 않을 수 있다.
//		멤버에 static 키워드를 사용 안 한 경우를 인스턴스 멤버라고 한다.
//		멤버에 static 키워드를 사용 한 경우는 스태틱 멤버 라고 한다
//		필드 선언 안에 있는 값들을 멤버 라고 한다.
		String model;
		int speed;
//		main() 메소드가 실행 되면서, main()메소드 안에 사용된 class를 먼저 찾고, 
//		그 클래스 안에 정적(static)멤버가 존재하면, 메소드 영역 이라는 곳에 기억장소를 생성한다.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ㅠ 
//		new는 정적 (static)은 힙 영역의 메모리생성에서 제외된다.
		
		static String color;
		
//		생성자 선언 
		Car (String model) {
//			매개변수에 this 는 사용을 할 수 없다. 
//			매개변수 : Car "(String model)" <
			this.model = model;
		}
		void setSpeed (int speed) {
			this.speed = speed;
		}
//		메소드
		void run( ) {
			this.setSpeed(100);
			System.out.println(this.model +"가 달려요 (시속 :" + this.speed + "km/h");
		}

}
