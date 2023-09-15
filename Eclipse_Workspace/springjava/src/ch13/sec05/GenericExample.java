package ch13.sec05;

public class GenericExample {

	public static void main(String[] args) {
//		모든 사람이 신청 가능한 수강과정
		
		Course.registerCourse1(new Applicant<Person>(new Person()));
		Course.registerCourse1(new Applicant<Worker>(new Worker()));
		Course.registerCourse1(new Applicant<Student>(new Student()));
		Course.registerCourse1(new Applicant<HighStudent>(new HighStudent()));
		Course.registerCourse1(new Applicant<MiddleStudent>(new MiddleStudent()));
		System.out.println();
		
//		학생만 신청 가능
		Course.registerCourse2(new Applicant<Student>(new Student()));
		Course.registerCourse2(new Applicant<HighStudent>(new HighStudent()));
		Course.registerCourse2(new Applicant<MiddleStudent>(new MiddleStudent()));
		
//		에러~
//		Course.registerCourse2(new Applicant<Person>(new Person()));
//		Course.registerCourse2(new Applicant<Worker>(new Worker()));
		
		System.out.println();
		
//		직장인 및 일반인만 신청가능. Student, HighStudent, MiddleStudent 제외
		Course.registerCourse3(new Applicant<Person>(new Person()));
		Course.registerCourse3(new Applicant<Worker>(new Worker()));
		System.out.println();
		
		
	}
}
