package ch07.sec01;



// 일반전화 클래스
public class Phone {
//	필드선언
	public String model;
	public String color;
	
	// 메소드 작성
	public void bell() {
		System.out.println("벨이 울려요!");
	}
	
	public void sendVoice(String message) {
		System.out.println("자기 : " + message);
	} 
	
	public void receiveVoice (String message) {
		System.out.println("상대방 : " + message);
	}
	
	public void hangUp() {
		System.out.println("전화를 끊습니다");
	} 
}
