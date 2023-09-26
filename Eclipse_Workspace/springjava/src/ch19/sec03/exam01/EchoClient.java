package ch19.sec03.exam01;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

// 클라이언트 통신 프로그램(TCP기반)
// 연결 : Socket
public class EchoClient {

   public static void main(String[] args) {
      
      try { // 강사용 컴퓨터 주소 192.168.0.49
         Socket socket = new Socket("192.168.0.56", 50001); // 객체가 생성되면, 연결이 됨을 의미
         System.out.println("[클라이언트] 연결 성공");
         
         // 입출력스트림 작업 : 클라이언트  채팅
         // 데이터 보내기
//         String sendMessage = "[김정웅] 192.168.0.9 잊지않겠다.";
         
//         OutputStream os = socket.getOutputStream(); // byte 기반으로 작업하는 클래스
//         
//         
//         String -> byte로 변환
//        byte[] bytes = sendMessage.getBytes("UTF-8");
//        os.write(bytes);
//        os.flush();
         
         // 보조스트림
         String sendMessage = "[김정웅] 192.168.0.9 잊지않겠다.";
         DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
         dos.writeUTF(sendMessage);
         dos.flush();
         System.out.println("[클라이언트] 데이터 보냄" + sendMessage);
         
//       데이터 받기
//       InputStream is = socket.getInputStream();
//       byte[] bytes2 = new byte[1024];
//       int readByteCount = is.read(bytes2);
//       String message = new String(bytes2, 0, readByteCount);
//       System.out.println("서버로부터 받은 내용" + message);

//         보조스트림을 이용한 입력 작업
         DataInputStream dis = new DataInputStream(socket.getInputStream());
         String message = dis.readUTF();
         System.out.println("[클라이언트] : 서버로부터 받은 내용" + message);
         	
         // Socket 닫기
         socket.close();
         
      }catch(UnknownHostException e) {
         // IP표기 방법이 잘못되었을 경우
      }catch (IOException e) {
         // 해당 포트 서버에 연결 할 수 없는 경우
      }
         
   }
}