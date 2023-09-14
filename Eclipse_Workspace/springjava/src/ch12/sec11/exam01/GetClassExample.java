package ch12.sec11.exam01;

//  리플랙션(Reflection) 사용 예제
public class GetClassExample {
	public static void main(String[] args) throws Exception {
		
//		Class객체 사용 : 리플랙션 기능을 지원하는 클래스.
//		방법 1
		Class class1 = Car.class;
		
//		방법 2
//		Class class2 = Class.forName("ch12.sec11.exam01.Car");
		
//		방법 3
//		Car myCar = new Car();
//		Class class3 = myCar.getClass();
	
	System.out.println("패키지 : " + class1.getPackage().getName());
	System.out.println("클래스 간단한 이름 : " +class1.getSimpleName());
	System.out.println("클래스 전체이름 : " + class1.getName());
	
	}
	
	
}
