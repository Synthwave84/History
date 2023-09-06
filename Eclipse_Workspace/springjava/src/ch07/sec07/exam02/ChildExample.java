package ch07.sec07.exam02;

public class ChildExample {
	public static void main(String[] args) {
		
//		child 객체에서 접근이 가능한 메소드와
//		자동 형변환된 parent 객체에서 접근이 가능한 메소드
//		차이가 있다. 
		
		
		
//		자식객체 생성
		Child child = new Child();
		
//		Parent 클래스에서 상속
//		child.method1();

//		재정의 사용
//		Parent클래스 method2()는 목록에서 숨겨져있음 super.method2()로 호출
//		child.method2();  

//	 	Child 클래스에서 추가 생성
//		child.method3();
		
		// 자동 타입변환
		Parent parent = child;
		
		parent.method1();

		
// 		Child 클래스의 method2()를 호출
//		Parent클래스의 method2()가 호출되는것이 아니라,
//		재정의가 된 메소드가 호출된다.
		parent.method2();; 
		
//		parent.method3(); < 호출불가
		
		
		
		
	}	
}
