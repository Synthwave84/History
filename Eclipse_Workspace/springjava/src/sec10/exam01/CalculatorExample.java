package sec10.exam01;

public class CalculatorExample {
	public static void main(String[] args) {

//		Calculator 클래스에 인스턴스 멤버가 존재 하지 않으면, 아래 객체생성작업은
//		하지 않는다.
//		Calculator calc = new Calculator();
//		메소드 영역에 생성된 정적(static) 멤버는 객체로 접근하는것은 권장하지 않는다.
//		ex ) calc.pi; 같이.
		
//		클래스 이름으로 접근 한다.
		double result1= 10 * 10* Calculator.pi;
		int result2 = Calculator.plus(10, 5);
		int result3 = Calculator.minus(10, 5);
		System.out.println("result 1 : " + result1);
		System.out.println("result 2 : " + result2);
		System.out.println("result 3 : " + result3);
		
	}
}
