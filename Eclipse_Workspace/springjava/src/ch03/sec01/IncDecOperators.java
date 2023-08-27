package ch03.sec01;

public class IncDecOperators {
	public static void main(String[] args) {
		// 증강 연산자.
		 int x= 10;
		 int y = 10;
		 int z;
		 
//		 구민이 단독으로 사용하면,. 증강연산자가 변수 위치에 
//		 상관 없이 변수 자신에 +1을 사용해서 저장한다.
		 x++; // 후위형 증가 연산자
		 ++x;// 전위형 증가연산자
		 
		 System.out.println("x : " +x);
		 System.out.println("-----------------------------------");
		 
		 // 구문이 단독으로 사용되면, 증강연산자가 변수 위치에 상관없이 변수 자신에 -1
		 y--;
		 --y;
		 System.out.println("y : " +y);
		 
		 System.out.println("-----------------------------------");
		 // x의 변수에 1을 더하여 저장 한 후 값을 읽어와서 z변수에 값을 대입한다.
		 // z = ++x;
		
		// x의 변수값을 먼저 읽어와서 z 변수에 값을 대입한다 그리고 x자신에 1을 더해 저장
		 z= ++x; 
		 System.out.println("z: " +z);
		 
		 System.out.println("x: " +x);
		 System.out.println("---------------------------------");
		 z= ++x + y++;
		 System.out.println("z: " +z);
		 System.out.println("x: " +x);
		 System.out.println("y: " +y);
		
	}
}
