package ch18.sec02.exam01;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class WriteExample {
	public static void main(String[] args) {
		
//		파일에 출력 작업을 하는 예제.
//		대상: 파일, 작업방향 : 출력스트림 데이터: 바이트스트림
		try {
//			os : 파일 스트림 객체(빨대)
			FileOutputStream os = new FileOutputStream("C:/DEV/Web1/History/Temp/test1.db");
//			데이터
			byte a = 10;
			byte b = 20;
			byte c = 30;
			
//			버퍼(빨대) 내부에 데이터 쓰는 작업
			os.write(a);
			os.write(b);
			os.write(c);
			
//			버퍼 (빨대)의  내용을 test1.db에 작성하는 작업
			os.flush();
			os.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
	}
}
