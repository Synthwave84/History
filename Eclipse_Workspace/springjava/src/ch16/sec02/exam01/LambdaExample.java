package ch16.sec02.exam01;

public class LambdaExample {
	public static void main(String[] args) {
		Person person = new Person();
//		추상메소드 람다식으로 재정의
//		person.action(추상메소드 람다식으로 재정의);
		person.action(() -> {
			System.out.println("출근합니다.");
			System.out.println("프로그래밍을 합니다.");
		});
		
//		실행문이 한개 일 경우 중괄호 생략 가능. 실행문의 세미콜론(;) 도 제거해도 된다.
		person.action(() -> System.out.println("퇴근합니다"));
	
	}
}
