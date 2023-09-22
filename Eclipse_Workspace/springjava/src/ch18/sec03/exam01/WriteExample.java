package ch18.sec03.exam01;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class WriteExample {
	public static void main(String[] args) {
		
		
		try {
			OutputStream os = new FileOutputStream("C:/DEV/Web1/History/Temp/test3.db");
			
			byte[] array = {10,20,30,40,50};
			
//			array 배열에서 1번 인덱스위치에서 3개를 읽어와서 스트림의
//			버퍼에 채운다.
			os.write(array, 1, 3);
			
			os.flush();
			os.close();
			
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
}
