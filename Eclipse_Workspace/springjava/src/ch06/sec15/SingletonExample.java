package ch06.sec15;

public class SingletonExample {
	public static void main(String[] args) {
		
//		싱글톤 클래스는 외부에서 객체 생성이 불가능 하다.
//		Singleton obj1 - new Singleton(); < 컴파일 에러가 난다.
//		Singleton obj2 - new Singleton(); < 컴파일 에러가 난다.
		
//		메소드 영역으로 관리되는 주소가 복사된다.
//		즉 obj1과 obj2의 주소가 동일하다.
		Singleton obj1 = Singleton.getInstance();
		Singleton obj2 = Singleton.getInstance();
		
		if (obj1 == obj2) {
			System.out.println("동일한 Singleton객체  입니다");
		} else {
			System.out.println("동일한 Singleton객체가 아닙니다");
		}
	}
}
