package ch06.sec14;

public class Car {
//	getter, setter 예제
	
//	 목적 > 필드를 private 접근자로 사용하며, 직접접근을 막고,
//	getter , setter메소드를 통한 간접접근으로 사용하고자 할 때 사용된다
//	직접 접근 ㅣ myCar.speed= -50; 잘못된 값이 사용되는 것을 막는다.
//	이것을 캡슐화, 은페화 라고 한다.
	
//	필드선언
	private int speed;
	private boolean stop;
	
//	Getter
//	스프링에서 읽을 때는 무조건 캐멀 케이스로 쓴다.
	public int getSpeed() {
		return speed;
	}
	
//	Setter
//	상단과 동일한 캐멀케이스 규칙을 사용한다.
//	이렇게 Getter,Setter를 사용하는 이유는. 메소드 안에서 한번 유효성 검사를 통해
//	에러를 미연에 방지 할 수 있기 때문이다.
	public void setSpeed(int speed) {
		if (speed <0) {
			this.speed = 0;
			return;
		}else {
			this.speed = speed;
		}
		this.speed = speed;
	}
	
//	Boolean 타입일 때는 get을 쓰지 않고 is 로 작성한다.
	public boolean isStop() {
		return stop;
	}
	
	public void setStop (boolean stop) {
		this.stop = stop;
		if(stop == true) this.speed=0; {
			
		}
	}
	
	
	
}
