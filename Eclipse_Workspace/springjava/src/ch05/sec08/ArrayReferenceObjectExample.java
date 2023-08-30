package ch05.sec08;

public class ArrayReferenceObjectExample {
	public static void main(String[] args) {
//		참조타입 배열
		/*
		 	string str1,str2,str3
		*/
		String[] strArray= new String[3];
		strArray[0]="Java";
		strArray[1]="Java";
		strArray[2]=new String("Java");

//		주소비교
		System.out.println(strArray[0] == strArray[1]); // true
		System.out.println(strArray[0] == strArray[2]); // false

//		데이터 비교(값)
		System.out.println(strArray[0].equals(strArray[2])); // false
		
//		배열의 크기(길이) 변경은 할 수 없다.
//		length 속성은 get만 지원한다. set 속성은 지원하지 않는다.
//		get = 가져오는것, set = 설정하는것
//		strArray.length = 30;
		
		
	}
}
