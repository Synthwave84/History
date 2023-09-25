package ch18.sec11;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileExample {
	public static void main(String[] args) throws Exception {
		
//		File객체 생성
//		객체생성 한다고 햇 ㅓ폴더 또는 파일이 생성되는 것은 아니다.
		File dir = new File("C:/DEV/Web1/History/Temp/images");
		File file1 = new File("C:/DEV/Web1/History/Temp/file1.txt");
		File file2 = new File("C:/DEV/Web1/History/Temp/file2.txt");
		File file3 = new File("C:/DEV/Web1/History/Temp/file3.txt");
		
//		존재하지 않으면 파일 또는 폴더 생성작업
		if(dir.exists() == false ) {dir.mkdirs(); }
		if(file1.exists() == false) {file1.createNewFile(); }
		if(file2.exists() == false) {file2.createNewFile(); }
		if(file3.exists() == false) {file3.createNewFile(); }
		
//		Temp 폴더의 내용 출력
		File temp = new File("C:/DEV/Web1/History/Temp");
		File[] contents = temp.listFiles();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd a HH:mm");
		for(File file : contents) {
			System.out.printf("%-25s", sdf.format(new Date(file.lastModified())));
			
			if(file.isDirectory()) {
//				폴더명
				System.out.printf("%-10s%-20s","<DIR>",file.getName());
			}else {
//				파일명
				System.out.printf("%-10s%-20s",file.length(),file.getName());
			}
			System.out.println();
		}
	}
}
