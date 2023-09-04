package sec08.exam03;

public class Car {
//	Return 키워드 사용 예제
//	reuturn [반환값]: 메소드의 실행을 종료, 제어를 호출한 곳으로 돌려준다.
//	반환값이 있을 경우, 함꼐 돌려준다.
	
//	필드선언
	int gas; 
	
//	void = 리턴 값이 없는 메소드. gas 매개변수로 값을 받아서, 
//	int gas의 필드값을 변경해준다.
	void setGas(int gas) {
		this.gas = gas;
	}
	
//	차의 가스 상태 확인
	boolean isLeftGas() {
		if (gas == 0) {
			System.out.println("가스가 없습니다.");
			return false;
		}
		System.out.println("gas가 있습니다");
		return true;
	}
//	운전 기능
	void run () {
		while(true) {
			if(gas > 0 ) {
				System.out.println("달립니다 (gas 잔량 :" + gas +")");
				gas -=1;
			}else {
				System.out.println("멈춥니다. (gas 잔량: " + gas + ")");
				return;
			}
		}
	}
}
