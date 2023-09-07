package ch07.sec10.exam02;


//  추상클래스는 abstract 키워드를 적용하면, 된다.
//  추상메소드를 1개라도 가지고있으면 클래스도 abstarct 키워드를 적용하여
//	추상클래스로 변경해주어야한다. 
public abstract class Animal {

/*	메소드의 구성
  	1) head - void method()
  	2) body 
  	{
  	
  	}
 */
	
//	일반 메소드 선언
	public void breathe() {
		System.out.println("숨쉰다.");
	}
	
//	추상메소드 body가 없다 = 블록{}
	abstract void sound();
}
