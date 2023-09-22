package ch18.sec03.exam01;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ReadExample {
	public static void main(String[] args) {
//		파일의 내용을 읽어오는 예제
		
		try {
			InputStream is = new FileInputStream("C:/DEV/Web1/History/Temp/test1.db");
			
			while(true) {
				int data = is.read();
				if(data == -1) break;
				System.out.println(data);
			}
			is.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}
}
