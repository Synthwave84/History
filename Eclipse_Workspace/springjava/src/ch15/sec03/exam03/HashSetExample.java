package ch15.sec03.exam03;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class HashSetExample {
	public static void main(String[] args) {
		
		Set<String> set = new HashSet<String>();
		
		set.add("Java");
		set.add("JDBC");
		set.add("JSP");
		set.add("Spring");
		
		Iterator<String> iterator = set.iterator();
		while (iterator.hasNext()) {
			String element = iterator.next();
			System.out.println(element);
			if(element.equals("JSP")) {
				iterator.remove();
			}
		}
		
		System.out.println("-----------------------");
		
		set.remove("JDBC");
		
		for(String element : set) {
			System.out.println(element);
		}
		
//		일반 for문은 사용 불가능. 인덱스 형태로 
//		객체가 관리되지 않는 특징이기 때문.
//		for(int i=0; i<set.size(); i++) {}
	}
}
