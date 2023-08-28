package ch05;

public class ReferenceVariableCompareExample {
	public static void main(String[] args) {
//		 참조타입 객체(변수) 비교
//		int a = 10; 스택영역에 저장.
//		참조타입에 변수를 선언하면, 그 변수는 힙 영역에 생성될 주소를 저장하는 목적으로 존재한다.
//		스택영역에 기억장소가 생성되고, 초기값은 null이 된다.
		int [] arr1;  // null
		int [] arr2;  // null
		int [] arr3;  // null
		
//		힙 영역에 실제 데이터가 저장되는 기억장소를 생성하고, 그 곳에 주소를 대입하는 구문.
		arr1= new int[] {1,2,3};
		arr2= new int[] {1,2,3};
		arr3= arr2; // arr2의 메모리 주소를 arr3 에게 주는것. 즉 heap 영역의 값이 아니다.
		
		System.out.println(arr1 == arr2)	; // false
		System.out.println(arr2 == arr3); // true
	}
}
