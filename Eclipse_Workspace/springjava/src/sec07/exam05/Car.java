package sec07.exam05;


//	생성자 오버로드 예제 : 생성자를 여러개 정의하는 의미
public class Car {
	
	
//	필드선언
	String company = "현대자동차";
	String model;
	String color;
	int maxSpeed;
	
//	생성자 선언. 4개 : 생성자 오버로딩
//	매개변수의 개수와 타입의 순서가 다른 경우인 문법이 허용된다.
//		디폴트 생성자는 다른 생성자 선언 때문에 자동 생성되지 아니하므로, 수동으로 선언함.
	
		Car(String model) {
			this(model, "은색", 250);
		}
		
		Car(String model, String color) {
			this(model, color, 250);
		}
		
		Car(String model, String color, int maxSpeed) {
			this.model = model;
			this.color = color;
			this.maxSpeed =maxSpeed;
		}
		
		
}	
