package ch19.sec04;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetSocketAddress;

public class NewsClient {
	public static void main(String[] args) {
		try {
//			송신
			DatagramSocket datagramSocket = new DatagramSocket();
			
//			구독하고 싶은 뉴스 주제 보내기
			String data = "정치";
			byte[] bytes = data.getBytes("UTF-8");
			DatagramPacket sendPacket = new DatagramPacket
					(bytes, bytes.length, new InetSocketAddress("localhost",50001));
					
			
					datagramSocket.send(sendPacket);
					
					while(true) {
//						뉴스받기
						DatagramPacket receivePacket = new DatagramPacket (new byte[1024], 1024);
						datagramSocket.receive(receivePacket);
						
//						문자열반환
						String news = new String
								(receivePacket.getData(), 0, receivePacket.getLength(), "UTF-8");
						System.out.println(news);
//						10번째 뉴스를 받았을 경우 while문 종료
						if(news.contains("뉴스 10")) {
							break;
						}
					}
					
//					닫기
					datagramSocket.close();
		} catch (Exception e) {
			
		}
	}
}
