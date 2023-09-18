package ch15.sec02.exam03;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

//	LinkedList 컬렉션 ; 객체 추가, 삽입 시 성능이 좋다.
//	ArrayList와 LinkedList 컬렉션의 성능차이
public class LinkedListExample {
	
	public static void main(String[] args) {
		
		List<String> list1 = new ArrayList<String>();
		
		List<String> list2 = new LinkedList<String>();
		
		long startTime;
		long endTime;
		
		startTime = System.nanoTime();
		for(int i=0; i<10000; i++) {
//			[0] : "0"
			list1.add(0, String.valueOf(i));
		}
		endTime = System.nanoTime();
		System.out.printf("%-17s %8d ns \n",  "ArrayList 걸린시간 : " , (endTime - startTime));
		
		startTime = System.nanoTime();
		for(int i=0; i<10000; i++) {
//			[0] : "0"
			list2.add(0, String.valueOf(i));
		}
		endTime = System.nanoTime();
		System.out.printf("%-17s %8d ns \n",  "LinkedList 걸린시간 : " , (endTime - startTime));
	}
}
