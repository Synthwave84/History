package ch07.sec09;

public class InstanceofExample {
	
	public static void personInfo( Person person ) {
		System.out.println("name : " + person.name);
		person.walk();
		
//		if(person instanceof Student) {
//			
//			System.out.println("Student객체입니다.");
//		}else {
//			System.out.println("Student객체가아닙니다.");
//		}
		
//		personInfo(p1) 호출 시 false. personInfo(p2) 호출시 true
		if(person instanceof Student) {
			Student student = (Student)person;
			System.out.println("student:No : " + student.studentNo);
		}
		
//		jdk12 V
//		if(person instanceof Student student) {
//		System.out.println("studentNo:" + student.studentNo);
//		student.study();
//		}
	}
	
	
	public static void main(String[] args) {
//		person instanceOf Student > false
		Person p1 = new Person("홍길동");
//		new 연산자가 힙 영역에 생성한 기억장소의 주소가 전달된다.
		personInfo(p1);
		
//		자동형변환
//		person instanceOf Student -> true
		Person p2 = new Student("손흥민", 10);
		personInfo(p2);
	}
}
