package ch02.sec13;

import java.util.Scanner;


public class ScannerExample {
public static void main(String[] args) {
//	Scanner를 사용하는 예제
//	기능 : 콘솔로 데이터를 입력받는 목적.
	 Scanner scanner = new Scanner(System.in); 
	 System.out.print("x값 입력 : ");
	 
	 // scanner.nextLine(); 이 코드로 실행이 되면, 키보드 데이터 입력을 받을 수 있는 상태가된다
	 // 진행: 키보드로 데이터입력 => 엔터키 => 입력한데이터 - 버퍼(임시저장소)에 저장.
	 String strX = scanner.nextLine(); // 반드시 숫자를 입력해야한다. 정수가 아니면 에러발생.
	 int x = Integer.parseInt(strX);
	 
	 System.out.print("y값 입력: ");
	 String strY = scanner.nextLine();
	 int y = Integer.parseInt(strY);
	 
	 int result =x +y;
	 System.out.println("x+y :" + result);
	 
	 while(true) {
		 System.out.println("입력 문자열 :");
	 	 String data = scanner.nextLine();
	 	 if(data.equals("q")) {
	 		 break;
	 	 }
	 	System.out.println("출력문자열 : "+ data);
	 	System.out.println();
	 }
	System.out.println("종료");
	System.out.println(scanner);
	}


}
