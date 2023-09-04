package sec08.exam04;

public class CalculatorExample {
	public static void main(String[] args) {
		
		Calculator myCalc = new Calculator();
//		result 1
		double result1 = myCalc.areaRectangle(10);
		System.out.println("정사각형의 넓이 : "+ result1);
//		result 2
		double result2 = myCalc.areaRectangle(10, 20);
		System.out.println("직사각형의 넓이 : " + result2);
		
	}
}
