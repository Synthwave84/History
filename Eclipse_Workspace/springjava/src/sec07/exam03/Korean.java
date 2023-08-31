package sec07.exam03;

public class Korean {
//	필드선언
	
	
	String nation = "대한민국";  // 초기값 고정
	String name;						// 값이 달라져야 한다
	String ssn;						// 값이 달라져야 한다.
	
//	매개변수가 있는 생성자 선언. 디폴트 생성자는 자동생성이 안됨.
//	하단의 예제가 exam02 보다 더욱 더 직관적이다.
//	생성자의 파라미터명과 필드명이 동일 한 경우,
//	필드명은 this. 필드명으로 구분해서 사용한다.
	public Korean(String name, String ssn) {
		this.name = name;
		this.ssn = ssn;
	}
	
}
