package sec09;

public class CarExample {
	public static void main(String[] args) {
//		new : 메모리 생성연산자. Car클래스의 인스턴스 멤버를 가지고, Heap 영역에 메모리를 생성한다.
//		정적 static 멤버는 제외한다.
		Car myCar = new Car("BMW E30");
		Car yourCar= new Car ("구아방");
//		myCar.color 정적멤버를 myCar로 접근하여 사용은 가능하나, 권장하지 아니한다.
//		myCar.color = "노랑"; C#은 자바의 이러한 단점을 문법적으로 허용을 하지 않는다.
	}
}
