package ch18.sec04.exam01;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class WriteExample {
	public static void main(String[] args) {
		
		try {
			Writer writer = new FileWriter("C:/DEV/Web1/History/Temp/test.txt");
			
//			1) 데이터
			char a= 'A';
			writer.write(a);
			char b = 'B';
			writer.write(b);
			
//			2) char 배열
			char[] arr = {'C','D','E'};
			writer.write(arr);
			
//			3) 문자열
			writer.write("FGH");
//			버퍼내용이 test.txt에 저장된다.
			writer.flush();
//			출력 스트림 닫기 = 메모리 해제
			writer.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
}
