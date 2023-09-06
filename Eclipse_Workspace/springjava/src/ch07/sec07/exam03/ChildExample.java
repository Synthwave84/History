package ch07.sec07.exam03;

public class ChildExample {
	public static void main(String[] args) {
		
//		자동타입변환
//		자식 Child객체의 멤버는 접근불가.
		Parent parent = new Child();
		
		parent.field1 = "data";
		parent.method1();
		parent.method2();
		
//		에러
//		parent.field2 = "data2";
//		parent.method3();
		
//		강제 타입변환 부모, 자식멤버 둘다 사용 가능
		Child child = (Child) parent;
		
		child.field1 = "data2";
		child.method3(); 
		
		
		
		
		
	}	
}
