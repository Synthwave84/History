package ch19.sec04;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketAddress;
import java.util.Scanner;

//	UDP 통신 네트워크 예제


/* 
  DatagramSocket : 연결 (송수신 기능)
  DatagramPacket : 데이터 주고받기 기능.
 
 */
public class NewsServer {
	
	private static DatagramSocket datagramSocket = null;
		
	
	public static void main(String[] args) {
		System.out.println("--------------------------------------------");
		System.out.println("서버 종료시 Q입력 후 Enter 를 입력하세요");
		System.out.println("--------------------------------------------");
		
//		UDP  서버 시작
		startServer();
		
		Scanner scanner = new Scanner(System.in);
//		실행 상태 유지.
		while(true) {
//			콘솔창에서 키보드 입력을 받고, 버퍼에 저장 및 읽어들이는 작업
			String key = scanner.nextLine();
			if(key.toLowerCase().equals("q")) {
				break;
			}
		}
		scanner.close();
		
		stopServer();
	}
	
	private static void stopServer() {
//		Port 50001 바인딩 해제.
		datagramSocket.close();
		System.out.println("[서버] 종료");
		
	}
	
	private static void startServer() {
//		작업스레드 정의 : 익명 구현 객체
		Thread thread = new Thread() {
			@Override
			public void run() {
				try {
					 datagramSocket = new DatagramSocket(50001);
					 System.out.println("[서버] 시작됨");
					 
					 while (true) {
						DatagramPacket receivePacket = new DatagramPacket(new byte[1024], 1024);
//						아래 구문이 실행되고, 클라이언트의 요청을 기다리는중. (Blocking)
						datagramSocket.receive(receivePacket);
						
//						클라이언트 데이터 확인 작업
						String newsKind = new 
								String(receivePacket.getData(), 0, receivePacket.getLength(), "UTF-8");
						
//						클라이언트의 IP와 Port 얻기
						SocketAddress socketAddress = receivePacket.getSocketAddress();
						
						for(int i=1; i<=10; i++) {
							String data = newsKind + ": 뉴스" + i;
							byte[] bytes = data.getBytes("UTF-8");
							DatagramPacket sendPacket = 
									new DatagramPacket(bytes, 0, bytes.length, socketAddress);
						}
					}
				} 
				catch (Exception e) {
					System.out.println("[서버]" +e.getMessage());	
				}
			}
		};
		
		thread.start();
	}

	
}
