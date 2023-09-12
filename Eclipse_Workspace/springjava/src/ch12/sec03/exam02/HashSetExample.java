package ch12.sec03.exam02;

import java.util.HashSet;

//  HashSet 컬렉션 클래스 : 객체를 저장시 사용하는 기능 제공
// 	동일 객체를 중복저장 불가능
//  Student클래스의 hashCode(), equals()재정의 구문을 주석 변경으로 확인가능.
public class HashSetExample {
	public static void main(String[] args) {
		HashSet hashSet = new HashSet();
		Student s1 = new Student(1, "홍길동");
//		내부적으로 hashCode()와 equals()메소드가 사용되어, 중복검사가 발생한다
//		add 로 s1객체를 추가 할 때마다 중복검사 후 추가시킨다.
		
		hashSet.add(s1);
		System.out.println("저장된 객체 수 :" + hashSet.size());
		
		Student s2 = new Student(1, "홍길동");
		hashSet.add(s2);
		System.out.println("저장된 객체 수 : " + hashSet.size());
		
		Student s3 = new Student(2, "홍길동");
		hashSet.add(s3);
		System.out.println("저장된 객체 수 : " + hashSet.size());
	}
}
