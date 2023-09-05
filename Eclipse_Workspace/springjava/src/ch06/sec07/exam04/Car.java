package ch06.sec07.exam04;


//	생성자 오버로드 예제 : 생성자를 여러개 정의하는 의미
public class Car {
	
	
//	필드선언
	String company = "현대자동차";
	String model;
	String color;
	int maxSpeed;
	
//	생성자 선언.
//		디폴트 생성자는 다른 생성자 선언 때문에 자동 생성되지 아니하므로, 수동으로 선언함.
		Car () {}
		
		Car(String model) {
			this.model=model;
		}
		
		Car(String model, String color) {
			this.model = model;
			this.color = color;
		}
		
		Car(String model, String color, int maxSpeed) {
			this.model = model;
			this.color = color;
			this.maxSpeed =maxSpeed;
		}
		
		
}	
