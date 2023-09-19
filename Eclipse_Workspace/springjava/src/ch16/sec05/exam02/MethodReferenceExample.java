package ch16.sec05.exam02;

public class MethodReferenceExample {
	public static void main(String[] args) {
		
		Person person = new Person();
//		람다식
//		person.ordering((a, b) -> a.compareToIgnoreCase(b));
		
//		메소드 참조 문법
		person.ordering(String :: compareToIgnoreCase);
	}
}
