package ch19.sec03.exam02;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

//	클라이언트 통신프로그램 (TCP 기반)
//	연결 : Socket 

public class ClientExample {
	public static void main(String[] args) {
		try {
//			객체가 생성되면, 서버와의 연결이 됨을 의미한다.
			Socket socket = new Socket("192.168.0.49", 50001);
			System.out.println("[클라이언트] 연결 성공");
			
//			입출력 스트림 작업 : 채팅
			
//			Socket 닫기
			socket.close();
			System.out.println("[클라이언트] 연결 끊음");
		} catch (UnknownHostException e) {
//			IP표기 방법이 잘못되었을 때.
		} catch (IOException e) {
//			해당 포트 서버에 연결 할 수 없는 경우.
		}
	}
}
