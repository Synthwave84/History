package ch12.sec03.exam01;

public class EqualsExample {
	public static void main(String[] args) {
		Member obj1= new Member("Blue");
		Member obj2= new Member("Blue");
		Member obj3= new Member("Red");
		
		System.out.println("obj1 :" + obj1.hashCode());
		System.out.println("obj1 :" + obj2.hashCode());
		System.out.println("obj1 :" + obj3.hashCode());
		
		
		if(obj1.equals(obj2)) {
			System.out.println("obj1과 obj2는 동등합니다.");
		}else {
			System.out.println("obj1과 obj2는 동등하지 않습니다.");
		}
		
		if(obj1.equals(obj3)) {
			System.out.println("obj1과 obj3는 동등합니다.");
		}else {
			System.out.println("obj1과 obj3는 동등하지 않습니다.");
		}
		
		
	}
}
