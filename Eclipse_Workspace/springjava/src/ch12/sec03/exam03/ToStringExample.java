package ch12.sec03.exam03;

public class ToStringExample {
	public static void main(String[] args) {
		SmartPhone myPhone = new SmartPhone ("삼성전자","안드로이드");
		
		String strObj = myPhone.toString();
//		@15db9742
		System.out.println(strObj);
//		toString() 메소드가 내부적으로 호출된다.
		System.out.println(myPhone);
	}
}
