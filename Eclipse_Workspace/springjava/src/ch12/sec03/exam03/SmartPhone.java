package ch12.sec03.exam03;

//	Object 클래스의 toString() 메소드 재정의
//  toString()	- 클래스명 '@16진수' 해시코드로 구성된 문자열을 리턴
//	hashCode :  객체가 참조하는주소를 내용으로 객체를 식별하는 목적으로 만든
//  유일한 정수
public class SmartPhone /*extends Object*/ {
	private String company;
	private String os;
	
	public SmartPhone(String company, String os) {
		this.company = company;
		this.os = os;
	}
//	재정의 했을 때 안했을 차이점을 확인.
//	재정의 내용 : 클래스의 필드 정보를 요약 형태로 보여주는 특징.
	@Override
	public String toString() {
		
		return company + "," +  os;
	}
}
