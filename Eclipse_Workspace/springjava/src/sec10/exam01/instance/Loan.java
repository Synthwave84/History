package sec10.exam01.instance;


//	정적 (static) 키워드를 클래스의 멤버에 사용 시, 공유목적으로 사용.
//  대출 예제. 
public class Loan {
//	대출 상품의 이율은 고정금리 3% 다.
//	대출이 1000개 발생되면, 이율(iYul)은 고정금리임에도 불구하고, 이를 3% 기억장소가 힙영역에 1000개 생성이되어
//	
//	이름, 금액, 이율
	String name;
	int price;
	int iYul;
	
	
	Loan(String name, int price, int iYul) {
		this.name = name;
		this.price = price;
		this.iYul = iYul;
	}
}
