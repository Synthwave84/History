package sec08.exam04;

public class Calculator {
	
//	메소드 오버로딩
//	하나의 클래스에서 동일한 메소드를 여러개 정의할 수 있는 기능.
//	하단의 areaRectangle 은 이름은 같으나 내부적으로는 다르다.
//	규칙 : 메소드의 매개변수 개수, 순서, 타입이 달라야한다.
	
//	사각형의 넓이 구하기
	
//	정사각형의 넓이를 구하는 메소드 : areaRectangle
	double areaRectangle (double width) {
		return width * width;
	}

//	직사각형의 넓이를 구하는 메소드 : areaRectangle
	double areaRectangle (double width, double height) {
		return width * height;
	}

}
