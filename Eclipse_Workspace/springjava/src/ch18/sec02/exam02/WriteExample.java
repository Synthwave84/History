package ch18.sec02.exam02;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class WriteExample {
	
	public static void main(String[] args) {
		
		try {
			OutputStream os = new FileOutputStream("C:/DEV/Web1/History/Temp/test2.db");
			
//			데이터
//			3바이트
			byte[] array= {10,20,30}; 
			
//			버퍼(빨대안) 내용 채우기
			os.write(array);
			
//			버퍼(빨대안 내용 쓰기 - test2.db
			os.flush();
//			스트림객체 닫기
			os.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

}
