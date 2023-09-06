package ch07.sec02;

public class SmartPhoneExample {
	public static void main(String[] args) {
//		SmartPhone 객체생성 . 부모클래스를 가지고 있는 SmartPhone 클래스

		SmartPhone myPhone= new SmartPhone("갤럭시", "은색");
		
				
//		Phone으로부터 상속받은 필드 읽기
		System.out.println("모델" + myPhone.model);
		System.out.println("색상" + myPhone.color);
		
//		SmartPhone의 필드 읽기
		System.out.println("와이파이 상태" + myPhone.wifi);
		
//		Phone으로 부터 상속받은 메소드 읽기
		myPhone.bell();
		myPhone.sendVoice("여보세요");
		myPhone.receiveVoice("안녕하세요 저는 홍길동이에요!");
		myPhone.sendVoice("아 네~ 반갑네요");
		myPhone.hangUp();
		
//		SmartPhone 의 메소드 호출
		myPhone.setWifi(true);
		myPhone.internet();
	}
}
