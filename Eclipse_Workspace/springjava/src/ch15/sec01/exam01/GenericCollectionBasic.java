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
	}
	
class Car {
	
}
	
	
	
	
	
	
	
}
