package sec07.exam02;

public class Korean {
//	필드선언
	
	
	String nation = "대한민국";  // 초기값 고정
	String name;						// 값이 달라져야 한다
	String ssn;						// 값이 달라져야 한다.
	
//	매개변수가 있는 생성자 선언. 디폴트 생성자는 자동생성이 안됨.
	public Korean(String n, String s) {
		name = n;
		ssn = s;
	}
	
}
