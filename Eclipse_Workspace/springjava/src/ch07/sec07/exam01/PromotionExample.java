package ch07.sec07.exam01;

//  자바 문법은 직계 상속관계 클래스일 경우에만 형변환 작업이 가능하도록 되어있다.



class A{} // A.class

class B extends A {} // B.class

class C extends A {} // C.class

class D extends B {} // D.class

class E extends C {} // E.class



public class PromotionExample {


	
	
	
//	JVM소속
	public static void main(String[] args) {

//		B -> A
		B b = new B(); 
//		C -> A
		C c = new C();
//		D -> B -> A
		D d = new D();
//		E -> C -> A
		E e = new E();
		
//		자동 형변환.  부모변수 = 자식객체
		A a1 = b;
		A a2 = c;
		A a3 = d;
		A a4 = e;
		
		B b1 = d;
		C c1 = e;
		

		System.out.println(a1);
		System.out.println(a2);
		System.out.println(a3);
		System.out.println(a4);
		System.out.println(b1);
		System.out.println(c1);

//		형변환 에러
//		
//		B b3 = e; 직계상속이 아니므로, 형변환 지원을 하지 않는다.
//		C C2 = d;
		
		
	}
	
}
