package ch15.sec03.exam01;

import java.util.HashSet;
import java.util.Set;


//	 Set인터페이스를 구현한 클래스 : 저장순서를 유지하지 안흔다. 객체가 중복되지 않음.
//	ch12.sec03,exam02 패키지에서 hashSetExample.java 예제 참고.
public class HashSetExample {
	public static void main(String[] args) {
		
		
//		HashSetMString> set = new HashSet<String>();
		Set<String> set = new HashSet<String>();
		
//		객체 저장 : 저장시마다 중복검사 시행
		set.add("Java");
		set.add("JDBC");
		set.add("Server/JSP");
//		중복객체 저장하지않음
		set.add("Java");
		set.add("MyBatis");
		
//		저장 객체 수 출력
		int size= set.size();
		System.out.println("총 객체 수 : " + size);
		
		
		
		
	}
}
