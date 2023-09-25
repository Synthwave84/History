package ch18.sec09;

import java.io.FileOutputStream;
import java.io.PrintStream;

public class PrintStreamExample {
	public static void main(String[] args) throws Exception {
		
		FileOutputStream fos = new FileOutputStream("C:/DEV/Web1/History/Temp/printstream.txt");
		PrintStream ps = new PrintStream(fos);
		
//		스트림의 내부(버퍼)에 데이터를 채우는 작업 - 출력작업
		ps.print("마치 ");
		ps.println("프린터가 출력하는 것 처럼");
		ps.println("데이터를 출력합니다.");
		ps.printf("|%6d|%-10s|%10s|\n",1,"홍길동","도적");
		ps.printf("|%6d|%-10s|%10s|\n",2,"이강인","선수");
		
		ps.flush();
		ps.close();
		
		
		
	}
}
