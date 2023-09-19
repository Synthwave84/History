package ch16.sec05.exam03;

public class ConstructorReferenceExample {
	public static void main(String[] args) {
		Person person = new Person();
		
//		람다식
//		Member m1 = person.getMember1((id) ->new Member(id));
//		new Member(String id) 가 생략되어있음
//		메소드 참조
		Member m1 = person.getMember1(Member :: new);
		System.out.println(m1);
		System.out.println();
//		람다식
// 		Member m2 = person.getMember2((id,name) ->{return new Member(id, name);});
//		메소드 참조
		Member m2 = person.getMember2(Member :: new);
		System.out.println(m2);
	
	
	}
}
