package ch18.sec08;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class DataInputOutputStreamExample {
	public static void main(String[] args) throws Exception{
		FileOutputStream fos = new FileOutputStream("C:/DEV/Web1/History/Temp/primitive.db");
		DataOutputStream dos = new DataOutputStream(fos);
		
//		기본타입 출력작업(스트림 내용을 채우기.)
		dos.writeUTF("홍길동");
		dos.writeDouble(95.5);
		dos.writeInt(1);
		
		dos.writeUTF("이강인");
		dos.writeDouble(90.3);
		dos.writeInt(2);
		
		dos.flush();
//		객체닫기를 객체생성의 역순으로 작업.
		dos.close();
		fos.close();
		
//		입력스트림에 보조스트림 연결
		FileInputStream fis = new FileInputStream("C:/DEV/Web1/History/Temp/primitive.db");
		DataInputStream dis = new DataInputStream(fis);
		
//		기본타입 입력작업(Read) : 출력작업 순서를 참조해야 한다. 
		for(int i=0; i<2; i++) {
			String name = dis.readUTF();
			double score = dis.readDouble();
			int order = dis.readInt();
			System.out.println(name + ":" + score + ":" + order);
		}
		
		fis.close();
		dis.close();
	}
}
