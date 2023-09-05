package ch06.sec10.exam03;

public class Car {
//		인스턴스 필드
		int speed;
		
//		인스턴스 메소드 인스턴스 메소드에서는 인스턴스 필드, 메소드는 사용 가능.
		void run() {
			System.out.println(speed + "으로 달립니다.");
		}
		
		void stop () {
			run();
		} 
//		정적 메소드. 정적 메소드에서는 인스턴스 필드, 메소드를 사용 불가능.
		static void simulate() {
//			지역변수
//			객체 생성은 지역레벨이므로, 해당 매소드가 실행이 끝나면, 메모리는 자동 소멸된다.
			Car myCar = new Car();
			myCar.speed = 200;
			myCar.run();
//			현재 생성자 함수로 stop 메모리 구역이 생성되지 않아서, 사용이 불가능하다.
//			이유는 stop()은 인스턴스 메소드 인데, 인스턴스 메소드는 new 라는 생성자함수를 통해
//			새로 메모리영역을 생성 해 주어야 한다.
//			main메소드의 36번 라인에서 객체생성작업을 하지 않으면, speed,run(),stop() 멤버필드의
//			정보가 힙 영역에 생성되지 않으므로, 접근 시 문제가 된다.
//			simulate()메소드의 경우, static 메모리이므로 main함수 실행 이전에 미리 메모리 영역이 생성되어있다.
			
//			인스턴스 메소드가 호출시 객체생성 작업이 안되어 있으면, 힙 영역 메모리상에 stop() 메소드의 정보가 없어서,
//			호출이 불가능하다
//			stop(); 호출 불가.
			
		}
//		메인함수 : 시작 (실행) 클래스 = main메소드는 작성되는 위치가 어떤 클래스든 상관 없다.
//		Car클래스의 구성요소인 메소드가 아니다. 그리고, JVM에 의하여 관리가 이루어진다.
		public static void main(String[] args) {
//		동일 위치에 있기 때문에, Car. 를 생략 할 수 있다.
//		클래스이름, 메소드에서 클래스이름 생략 가능!
			simulate();
			Car myCar= new Car();
			
			myCar.speed = 60;
			myCar.run();
		}
}
