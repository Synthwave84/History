package ch18.sec03.exam02;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ReadExample {
	public static void main(String[] args) {
//		파일의 내용을 읽어오는 예제
		
		try {
			InputStream is = new FileInputStream("C:/DEV/Web1/History/Temp/test2.db");
//			100바이트 기억저장소. 기본값 = 0
			byte[]data = new byte[100]; 
			
			while(true) {
//				data배열의 크기만큼 읽어온다. 실제 데이터는 3바이트.
				int num = is.read(data);
				if(num == -1) break;
				for(int i=0; i<num; i++) {
					System.out.println(data[i]);
				}
			}
			is.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}
}
