package ch05.sec05;

public class SplitExample {
	public static void main(String[] args) {
		String board = " 1, 자바학습, 참조타입String을 학습합니다, 홍길동";
//		문자열 분리
		String [] tokens = board.split(",");
		
//		인덱스 별로 읽기
		System.out.println("번호 :" + tokens[0]);
		System.out.println("제목 :" + tokens[1]);
		System.out.println("내용 :" + tokens[2]);
		System.out.println("이름 :" + tokens[3]);
//		for문 을 이용하여 읽기
		for(int i=0; i<tokens.length; i++) {
			System.out.println(tokens[i]);
		}
	}
}
