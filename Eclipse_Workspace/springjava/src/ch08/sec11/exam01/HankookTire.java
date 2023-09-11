package ch08.sec11.exam01;

//  바퀴(타이어) 제조 업체
public class HankookTire implements Tire {
	
//	재정의
	@Override
	public void roll() {
		// TODO Auto-generated method stub
		System.out.println("한국타이어가 회전합니다.");
	}
}
