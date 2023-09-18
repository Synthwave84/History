package ch15.sec05.exam02;

import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.Set;
import java.util.TreeMap;

//	TreeMap클래스는 이진트리 구조로 데이터를 관리. 각 노드에 k,v Entry구조로 관리된다.
public class TreeMapExample {
	public static void main(String[] args) {
		
		TreeMap<String, Integer> treeMap = new TreeMap<String, Integer>();
		treeMap.put("apple", 10);
		treeMap.put("forever", 60);
		treeMap.put("description", 40);
		treeMap.put("ever", 50);
		treeMap.put("zoo", 80);
		treeMap.put("base", 20);
		treeMap.put("guess", 70);
		treeMap.put("cherry", 30);
//		정렬되어 있는 상태.
		
//		정렬된 엔트리를 하나씩 가져오기
		Set<Entry<String, Integer>> entrySet = treeMap.entrySet();
		for(Entry<String, Integer> entry : entrySet) {
			System.out.println(entry.getKey()+ "-" + entry.getValue());
		}
		System.out.println();
//		정렬기준 = 오름차순
		
//		특정 키에 대한 값 가져오기
		Entry<String, Integer> entry = null;
		entry = treeMap.firstEntry();
		System.out.println("제일 앞 단어: " +entry.getKey() + "-" + entry.getValue());
		entry = treeMap.lastEntry();
		System.out.println("제일 끝 단어: " +entry.getKey() + "-" + entry.getValue());
		entry = treeMap.lowerEntry("ever");
		System.out.println("ever 앞 단어: " +entry.getKey() + "-" + entry.getValue());
		
//		내림차순으로 정렬하기
		NavigableMap<String, Integer> descendingMap = treeMap.descendingMap();
//		Set  = 특정한 데이터를 관리하는 집합체
		Set<Entry<String,Integer>> descendingEntrySet = descendingMap.entrySet();
		for (Entry<String,Integer> e : descendingEntrySet) {
			System.out.println(e.getKey() + "-" + e.getValue());
		}
		System.out.println();
		
//		범위검색
		System.out.println("c~h사이의 단어 검색");
		NavigableMap<String, Integer> rangeMap = treeMap.subMap("c", true, "h", false);
		for(Entry<String, Integer>e: rangeMap.entrySet()) {
			System.out.println(e.getKey() + "-" + e.getValue());
		}
		
	}
}
