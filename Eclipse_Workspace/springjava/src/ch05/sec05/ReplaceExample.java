package ch05.sec05;

public class ReplaceExample {
	public static void main(String[] args) {
//		문자열 대체.
		String oldStr = "자바 문자열은 불변입니다. 자바 문자열은 String입니다";
//		 힙영역에 새로운 문자열 기억장소가 생성되고, 주소가 대입된다.
		String newStr = oldStr.replace("자바", "JAVA");
		
		System.out.println(oldStr);
		System.out.println(newStr);
		
		if (oldStr == newStr) {
			System.out.println("참조가 같다.");
		}else {
			System.out.println("참조가 다르다");
		}
	}
}
