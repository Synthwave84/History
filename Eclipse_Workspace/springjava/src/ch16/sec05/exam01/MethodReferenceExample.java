package ch16.sec05.exam01;

public class MethodReferenceExample {
	public static void main(String[] args) {
		
		Person person = new Person();
		

//		1) 정적 메소드 사용
//		람다식
//		person.action((x ,y) ->  Computer.staticMethod(x, y));
		
//		메소드 참조
		person.action(Computer :: staticMethod);
		
//		2) 인스턴스 메소드일 경우.
		Computer computer = new Computer();
//		람다식
//		person.action((x , y) -> computer.instanceMethod(x , y));
//		메소드 참조 문법
		person.action(computer :: instanceMethod);
	}
}
