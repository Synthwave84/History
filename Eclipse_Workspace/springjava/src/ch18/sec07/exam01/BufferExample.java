package ch18.sec07.exam01;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

//	보조 스트림의 사용유무에 따른 복사예제.
//	버퍼 스트림. BufferedInputStream, BufferedOutputStream.
	
public class BufferExample {
	public static void main(String[] args) throws Exception {
//		작업 1> 입출력 스트림 생성
//		C:\DEV\Web1\History\Eclipse_Workspace\springjava\bin\ch18\sec07\exam01
		String originalFilePath1 = BufferExample.class.getResource("OriginalFIle1.jpg").getPath();
		String targetFilePath1 = "C:/DEV/Web1/History/Temp/targetFile1.jpg";
		FileInputStream fis = new FileInputStream(originalFilePath1);
		FileOutputStream fos = new FileOutputStream(targetFilePath1);
//		작업 2> 입출력 스트림 생성 + 버퍼스트림 생성)(보조)
		String originalFilePath2 = BufferExample.class.getResource("OriginalFIle2.jpg").getPath();
		String targetFilePath2 = "C:/DEV/Web1/History/Temp/targetFile2.jpg";
//		메인스트림
		FileInputStream fis2 = new FileInputStream(originalFilePath2);
//		보조스트림
		BufferedInputStream bis = new BufferedInputStream(fis2);
		
//		메인스트림
		FileOutputStream fos2 = new FileOutputStream(targetFilePath2);
//		보조스트림
		BufferedOutputStream bos = new BufferedOutputStream(fos2);
		
//		파일 복사 기능
//		버퍼스트림 미사용
		long nonBufferTime= copy(fis,fos);
		System.out.println("버퍼스트림 미사용:\t "+ nonBufferTime +"ns");
//		버퍼스트림 사용
		long bufferTime = copy(bis, bos);
		System.out.println("버퍼스트림 사용 \t" +bufferTime+"ns");
		
//		입출력 스트림에서는 객체 생성시, 객체닫기를 반드시 해야한다. 닫기 순서는
//		생성을 역순으로 한다.
		fis.close();
		fos.close();
		
		bis.close();
		fis2.close();
		
		bos.close();
		fos2.close();
	}
//		파일 복사기능. 버퍼 보조 스트림 사용유무에 따른 시간체크
		public static long copy(InputStream is, OutputStream os) throws Exception {
//			시작시간 > 1970.1.1. 0:00:00
			long start = System.nanoTime();
//			복사작업
			while(true) {
				int data = is.read();
				if(data == -1) break;
				os.write(data);
			}
			os.flush();
			
//			종료시간
			long end = System.nanoTime();
//			복사 시간
			return (end-start); 
		}
	
	
	
}
