package ch18.sec07.exam02;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;

//	파일의 내용을 읽기.
//	문자 스트림 방식.
public class ReadLineExample {
	public static void main(String[] args) throws Exception {
		 BufferedReader br = new BufferedReader(new FileReader(
				 "src/ch18/sec07/exam02/ReadLineExample.java"));
		 
//		 라인 = 행
		 int lineNo = 1;
		 while(true) {
			 String str = br.readLine();
			 if(str == null) break;
			 System.out.println(lineNo + "\t" + str);
			 lineNo++;
		 }
		 br.close();
	}
}
