package ch06.sec10.exam01.staticmem;


//	정적 (static) 키워드를 클래스의 멤버에 사용 시, 공유목적으로 사용.
//  대출 예제. 
public class Loan {
//	대출 상품의 이율은 고정금리 3% 다.
//	이율을 정적 static 멤버로 변경하면 메소드영역에 단 1번만 생성이 되면서
//	기억장소를 공유목적으로 사용이 가능하다.
//	1000개의 대출이 생성될때, 1000번의 객체생성 구문에서 힙 영역의 메모리 생성에서
//	제외되어, 불필요한 메모리 로스를 방지한다.
//	이름, 금액, 이율
	String name;
	int price;
	static int iYul = 3;
	
	
	Loan(String name, int price) {
		this.name = name;
		this.price = price;
		
	}
}
