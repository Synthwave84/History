package ch07.sec04.exam01;

public class ComputerExample {
	public static void main(String[] args) {
		
		int r = 10;
		
//		부모클래스 Calculator 객체 생성... 자식 Computer 클래스는 상관 없다.
//		즉 자기 클래스의 메소드만 호출 한다.
		Calculator calculator = new Calculator();
		calculator.areaCircle(r);
		System.out.println("원 면적 : " + calculator.areaCircle(r));
		System.out.println();
		
//		자식 클래스 Computer 객체 생성
//		자식클래스에서는 반대로 부모 클래스의 메소드가 호출되지 않는다.
		Computer computer = new Computer();
//		computer.areaCircle(r);
		System.out.println("원 면적 : "+ computer.areaCircle(r));
		
//		부모클래스이 areaCircle() 메소드가 목록에서 숨겨져 있음.
//		호출 방법은 super. 으로 호출 할 수 있다
//		super.areaCircle();
	}
}
