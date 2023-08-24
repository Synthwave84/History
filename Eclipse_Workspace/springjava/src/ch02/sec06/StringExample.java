package ch02.sec06;

public class StringExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// String  데이터타입 : 문자열데이터를 저장목적
		// 큰 다옴표 사용.
		String name = "홍길동";
		String job = "프로그래머";
		System.out.println(name);
		System.out.println(job);
//		ESCAPE 특수문자 사용. \ 역슬래시
		String str = "나는 \"자바\" 과정을 잘 수료해서, 개발자로 나갈겁니다.";
		System.out.println(str);
		str = "번호 \t이름 \t직업";
		System.out.println(str);
		System.out.println("나는\n");
		System.out.println("자바를\n");
		System.out.println("배웁니다\n");
	}

}
