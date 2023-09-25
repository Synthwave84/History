package ch18.sec06;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

/*
 -	보조 스트림 (2차 스트림)
 	메인스트림(1차 스트림)을 기반으로 하여, 보조적으로 추가해 사용하는 스트림.
 -  문자 변환 스트림. InputstreamReader, OutputStreamWriter
 	바이트기반 스트림 -> 문자 기반 스트링으로 변환하여 작업할 때 사용.
 	
 */
public class CharacterConvertStreamExample {
	public static void main(String[] args) throws Exception {
		write("문자변환 스트링을 사용합니다.");
		String data = read();
		System.out.println(data);
	}

//  파일 생성하여, 문자데이터를 쓰기 작업 : 출력 스트림
	public static void write(String str) throws Exception {
//		스트림 객체를 생성하면, 파일이 생성된다.
//		자바는 기본 인코딩 UTF-8
		OutputStream os = new FileOutputStream("C:/DEV/Web1/History/Temp/test.txt");
		
//		작업
		
//		스트림 -> 문자기반으로 변환작업..  OutputStreamWriter
		Writer writer = new OutputStreamWriter(os, "UTF-8");
//		스트림 내에 내용이 채워진 상태.
		writer.write(str);
//		파일의 스트림 안의 내용을 파일에 작성. 버퍼가 비워짐.
		writer.flush();
//		메모리 비활성화.
		writer.close();	
	}

//	파일의 내용을 읽기 작업을 함 : 입력 스트림
	public static String read() throws Exception {
		InputStream is = new FileInputStream("C:/DEV/Web1/History/Temp/test.txt");
		
//		작업
		
//		스트림 -> 문자 기반으로 변환 작업.
		 Reader reader = new InputStreamReader(is, "UTF-8");
		 char[] data = new char[100];
//		 num은 읽어온 갯수.
		 int num = reader.read(data);
		 reader.close();
		 
		 String str = new String(data, 0, num);
		 
		 
		return str;
	}

}
