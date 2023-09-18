package ch15.sec04.exam01;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

//	Map 인터페이스를 구현한 HashMap 클래스 예제.
//	Key, Value 한쌍의 구조로 되어 관리된다. 한 쌍의 구조를 Entry 라고 한다.
public class HashMapExample {
	
	public static void main(String[] args) {
		
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("홍길동", 85);
		map.put("이순신", 95);
		map.put("홍범도", 80);
//		"홍길동* key가 중복되지만, 가존 키에 값이 덮어씌워진다.
		map.put("홍길동", 80);  
		
		System.out.println("총 Entry 수 : " + map.size());
		System.out.println();
		
		// 키로 값 얻기
		String key = "홍길동";
		int value = map.get(key);
		System.out.println(key + " : " +value);
		System.out.println();
		
		
		Set<Entry<String, Integer>> entrySet = map.entrySet();
		Iterator<Entry<String, Integer>> entryIterator = entrySet.iterator();
		while(entryIterator.hasNext()) {
//			map.put("홍길동",85); 저장되어 있다.
			Entry<String, Integer> entry = entryIterator.next();
			String k = entry.getKey();
			Integer v = entry.getValue();
			System.out.println(k + " : " + map.size());
			System.out.println();
		}
		
	}
}
