package ch06.sec11.exam01;

//	final : 필드에 사용되면, 초기값이 고정된다. 즉 변경 불가능

public class Korean {
//	final = 최종적인 사전뜻. 즉 절대 데이터. 한번 선언하면 변경 불가.
	final String nation = "대한민국";
	final String ssn;
	
	String name;
	
//	생성자 작업을 하지 않으면, ssn필드 에러가 발생된다.
	public Korean(String ssn, String name) {
		this.ssn = ssn;
		this.name = name;
	}
}
