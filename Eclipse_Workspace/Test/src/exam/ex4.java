package exam;

	class T1 {
		void t1() {
			System.out.println("t1호출");
		}
	}


public class ex4 extends T1 {
	void t1() {
		System.out.println("ex4클래스의 t2메소드 호출");
	}
	
	public static void main(String[] args) {
		T1 t = new ex4();
		t.t1();
		
	}
	
	
}
