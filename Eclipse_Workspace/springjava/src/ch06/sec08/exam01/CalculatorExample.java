package ch06.sec08.exam01;

public class CalculatorExample {
	public static void main(String[] args) {
		//myCalc
		
		Calculator myCalc = new Calculator();
		
//		계산기 전원 on
		myCalc.powerOn();
		
		System.out.println("5+6 = "+ myCalc.plus(5, 6));
		
		int x = 10;
		int y = 4;
		
		double result2 = myCalc.divide(x,y);
				
		System.out.println(result2);
		System.out.println("15/45 = "+myCalc.divide(15, 45));
//		계산기 전원 off
//		int  a = 10;
//		int  b = 4;
		
		int result3 = myCalc.minus(x, y);
//		int result3 = myCalc.minus(10, 4);
		System.out.println(result3);
		System.out.println(myCalc.minus(10,4));
		
		int c = 5;
		int d = 10;
		
		int result4 = myCalc.multiply(c, d);
		System.out.println(result4);
		
		myCalc.powerOff();
	}
}
