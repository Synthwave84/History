package ch15.sec02.exam02;


//	책의 스레드 관련 예제와는 다르다
//	스레드와는 조금 상관 없다.
import java.util.List;
import java.util.Vector;

import ch15.sec02.exam01.Board;

public class VectorExample {
	public static void main(String[] args) {
		
//		Vector<Board> list = new Vector<Board>();
		List<Board> list = new Vector<Board>();
		
//		객체추가
//		힙 영역의 주소 추가
		
//		list.get(0)
		list.add(new Board ("제목1", "내용1" ,"글쓴이 1"));
//		list.get(1)
		list.add(new Board ("제목2", "내용2" ,"글쓴이 2"));
//		list.get(2)
		list.add(new Board ("제목3", "내용3" ,"글쓴이 3"));
//		list.get(3)
		list.add(new Board ("제목4", "내용4" ,"글쓴이 4"));
//		list.get(4)
		list.add(new Board ("제목5", "내용5" ,"글쓴이 5"));
		
//		저장된 중 객체 수 얻기
		int size = list.size();
		System.out.println("총 객체 수 :" + size);
		System.out.println();
		
//		모든 객체를 확인하자
		for (int i=0; i<list.size(); i++ ) {
//			i가 0 1, 2, 3, 4, 5
			Board b = list.get(i);
			System.out.println(b.getSubject() + "\t" + b.getContent() + "\t" + b.getWriter());
		}
		System.out.println();
//		객체 삭제
		
//		new Board ("제목3", "내용3" ,"글쓴이 3"));
		list.remove(2);
//		list.add(new Board ("제목4", "내용4" ,"글쓴이 4"));
		list.remove(2);
		
//		list get(2); = 제목5 내용 5 글쓴이 5가 된다.
		
//		향상된 for문
		
		for(Board b : list) {
			System.out.println(b.getSubject() + "\t" + b.getContent() + "\t" + b.getWriter());
		}
		
		
		
		
		
	}
}
