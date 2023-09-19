package ch16.sec04;

public class Person {
	public void action(Calculable calculable) {
		double result = calculable.calc(10, 4);
		System.out.println("결과" + result);
	}
}
