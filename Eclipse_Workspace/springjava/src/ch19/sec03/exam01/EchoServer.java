package ch19.sec03.exam01;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

//
//	서버용 통신 프로그램 (TCP기반)
//	서버용 : ServerSocket 클래스
//	연결 : Socket 클래스
public class EchoServer {
	
//	서버 통신 프로그램. ServerSocket 클래스 사용
	private static ServerSocket serverSocket = null;
	
	public static void main(String[] args) {
		System.out.println("------------------------------------");
		System.out.println("서버 종료 : q,Q 입력하고, Enter키를 입력하세요");
		System.out.println("------------------------------------");
		
//		TCP 서버 시작.
		startServer();
		
//		키보드 입력. Scanner 클래스 : 콘솔에서 키보드 입력을 받는 기능 제공 
//		System.in  : 표준 입력 스트림
		Scanner scanner = new Scanner(System.in);
		while(true) {
//			콘솔환경에서 키보드 데이터 입력후 Enter를 입력하면, 버퍼에 데이터가 저장된다.
//			버퍼에 저장된 내용을 읽고 변수에 저장
			String key = scanner.nextLine();
			if(key.toLowerCase().equals("q")) {
				break;
			}
		}
		scanner.close();
		
//		TCP 서버 종료
		stopServer();
	}
	
	private static void stopServer() {
		try {
			serverSocket.close();
			System.out.println("[서버] 종료됨.");
		} catch (IOException e) {}
		
	}
	private static void startServer() {
//		작업 스레드 정의
		
//		익명 구현객체 구문
		Thread thread = new Thread() {
			@Override
			public void run() {
//				Port는 충돌되지 않아야 한다. 다른 프로그램에서 사용이 되지 않는것.
//				즉 미사용 포트를 사용해야된다. Dynamic port 에서 선택.
				try {
					serverSocket = new ServerSocket(50001);
					System.out.println("[서버] 시작됨");
//					실행중인 상태 유지
					while(true) {
						System.out.println("\n[서버] 연결 요청을 기다림\n");
//						연결 수락(클라이언트 요청이 오면 수락하는 작업)
//						Block 상태(대기중) : 클라이언트 요청 발생.
						Socket socket = serverSocket.accept();
//						socket 객체 : 
//						1) 연결된 클라이언트 정보참조.
//						2) 입출력 스트림 정보참조.
						
//						1) 연결된 클라이언트 정보 참조.
						InetSocketAddress isa = (InetSocketAddress) socket.getRemoteSocketAddress();
						System.out.println("[서버]" + isa.getHostName() + "의 연결 요청을 수락함." );
						
//						2) 입출력 스트림 작업 : 채팅
//						데이터 받는 작업
//						InputStream is = socket.getInputStream();
////						입력스트림을 통하여 읽어들일 데이터 저장 목적.
//						byte[] bytes = new byte[1024];
//						int readByteCount = is.read(bytes);
////						byte -> String
//						String message = new String(bytes, 0, readByteCount);
//						System.out.println(isa.getHostName() +"로부터 받은 내용" + message);
						
						DataInputStream dis = new DataInputStream(socket.getInputStream());
						String message = dis.readUTF();
						System.out.println(isa.getHostName() + "로부터 받은 내용" + message);
						
//						
						System.out.println("[서버]" + isa.getHostName()+ "의 연결을 끊음");	
//						데이터 보내기
//						OutputStream os = socket.getOutputStream();
//						String message2 = "민족의 명절 추석 한가위 잘 보내세요.";
//						bytes = message2.getBytes("UTF-8");
//						os.write(bytes);
//						os.flush();
						DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
						message = "현준아똥머거";
						dos.writeUTF(message);
						dos.flush();
						System.out.println("[서버] 데이터를 보냄" + message);
//						연결 끊기
						socket.close();
					}
				} catch (IOException e) {
//					e.printStackTrace();
					System.out.println("[서버] " + e.getMessage());
				
				}
				;
			}
		};
//		스레드시작
//		run() 메소드를 호출하는 작업. CPU 점유가 되었을 때(실행 스레드)
		thread.start();
	}
	
}
