package ch18.sec04.exam02;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class ReadExample {
	public static void main(String[] args) {
//		문자 기반의 입력 스트림 작업.
		Reader reader = null;
		
		try {
//			문자단위로 읽기
			reader = new FileReader("C:/DEV/Web1/History/Temp/test.txt");
			while(true) {
				int data = reader.read();
				if(data == -1) break;
				System.out.print((char) data);
			}
			reader.close();
			System.out.println();
			
			
//			배열의 크기만큼 읽기.  200바이트씩 읽기
			reader = new FileReader("C:/DEV/Web1/History/Temp/test.txt");
			char [] data = new char[100];
			while(true) {

				int num= reader.read(data);
				if(num == -1) break;
				for(int i=0; i<num; i++) {
					System.out.print(data[i]);
				}
			}
//			문자 배열로 읽기
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
}
