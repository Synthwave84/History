package ch15.sec05.exam03;

import java.util.TreeSet;

public class ComparableExample {
	public static void main(String[] args) {
		
		
		
		TreeSet<Person> treeSet = new TreeSet<Person>();
		
		treeSet.add(new Person("홍길동", 45));
		treeSet.add(new Person("손흥민", 31));
		treeSet.add(new Person("이순신", 55));
		
		for(Person person : treeSet) {
			System.out.println(person.name + ":" + person.age);
		}
		
	}
}
