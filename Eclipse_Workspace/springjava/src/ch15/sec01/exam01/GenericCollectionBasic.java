package ch15.sec01.exam01;

import java.util.ArrayList;

/*
 * 	컬렉션 : 기억장소, 객체를 저장하는 목적.
 * 		- 배열비교
 * 			-> 동일한 데이터타입으로, 연속적인 형태의 기억장소를 하나의 이름으로 관리.
 * 			-> 길이가 고정되어 있어, 길이 변경 불가능.
 * 
 * 				예시 >int [] arr = new int[10];
 * 
 * 				arr.length;
 * 				arr.length = 10; < 에러발생
 * 
 * 		- 컬렉션의 특징 
 * 			-> 컬렉션 기능을 제공하는 클래스를 통하여, 개체를 생성 했을 시,
 * 			-> 힙 영역에 기본크기의 기억장소가 생성된다. 
 * 			-> 데이터가 추가 될 때 마다, 기억장소가 자동으로 생성되며, 데이터를 저장한다. 
 * 
 * 
 * 	제네릭
 */

public class GenericCollectionBasic {
	public static void main(String[] args) {
//		컬렉션 기능을 제공하는 클래스
		ArrayList al = new ArrayList();
		al.add(10);
		al.add("기일똥쓰");
		al.add(true);
		al.add(10.5);
		al.add(new Car());
		al.add(new Person());
	
//	 제너릭을 활용한 컬랙션 클래스 사용
//		컬렉션 형태의 구조를 가지고 있는 기억장소는 내부적으로 데이터를 Ojbect 클래스로
//		관리한다
		ArrayList al2 = new ArrayList();
		
//		제네릭 클래스를 사용할 경우에는 무조건 참조타입만 가능하다.
		ArrayList<String> al3= new ArrayList<String>();
		al3.add("길동");
		al3.add("흥민");
		
		ArrayList<Car> al4= new ArrayList<Car>();
		al4.add(new Car());
		
		ArrayList<Person> al5 = new ArrayList<Person>();
		al5.add(new Person());
	}	
		
}
class Car {
	
}
	
class Person {
	
}
	
	
	
	
	

