package ch06.sec12.hyundai;

import ch06.sec12.hankook.SnowTire;
import ch06.sec12.kumho.AllSeasonTire;

public class Car {
//	다른 패키지의 동이한 이름의 클래스를 사용 시 , 풀네임 형식으로 코딩하라. 
//	패키지명. 클래스이름
//	import로 사용 하지 말것. 
//	(풀네임 이라고 한다.)
	ch06.sec12.hankook.Tire tire1 = new ch06.sec12.hankook.Tire();
	ch06.sec12.kumho.Tire tire2 = new ch06.sec12.kumho.Tire();
	SnowTire tire3 = new SnowTire();
	AllSeasonTire tire4 = new AllSeasonTire();
}
