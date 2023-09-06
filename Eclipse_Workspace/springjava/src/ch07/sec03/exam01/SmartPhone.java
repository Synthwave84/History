package ch07.sec03.exam01;

public class SmartPhone extends Phone {

//		생성자 생성
		public SmartPhone(String model, String color) {
//			컴파일 과정에서 부모클래스의 기본 생성자를 호출하는 목적으로 자동 생성되나
//			수동으로 작성해도 괜찮다.
			super();  
			this.model = model;
			this.color = color;
			System.out.println("public SmartPhone(String model, String color) 생성자 실행");
		}
}
