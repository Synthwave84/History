package ch13.sec05;


//	학원 과정
//	모든 대상이 등록가능한 과정 , 학생만 등록 가능, 직장인 및 일반인만 등록 가능
public class Course {
//	모든 대상이 등록 가능한 과정
	public static void registerCourse1 (Applicant<?> applicant) {
		System.out.println(applicant.kind.getClass().getSimpleName()+ "이(가) Course1을 등록함");
	}
//	학생만 등록 가능한 과정 . 최상위 클래스 Student를 상위로 하는 클래스
	public static void registerCourse2 (Applicant<? extends Student> applicant) {
		System.out.println(applicant.kind.getClass().getSimpleName() + "이(가) Course2를 등록함");
	}
//	직장인 및 일반인 등록 가능한 과정 최하위 클래스 Worker를 하위로 하는 클래스.
	public static void registerCourse3 (Applicant<? super Worker> applicant) {
		System.out.println(applicant.kind.getClass().getSimpleName() + "이(가) Course3를 등록함.");
	}
}
