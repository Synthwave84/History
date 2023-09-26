package ch19.sec02;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

// 네트워크 관련
// 자바jnet 패키지밋치능 제공
// inetAddress 클래스 = ip주소를 관리하는 인터넷 기능담당클래스



public class InetAddressExample {
	public static void main(String[] args) {
		InetAddress local;
		try {
			local = InetAddress.getLocalHost();
			System.out.println("내 컴퓨터의 IP 주소:" +  local.getHostAddress());

//			www.naver.com을 자신의 컴퓨터에 설정된 dns서버IP로부터 응답받음.
			InetAddress[] iaArr = Inet4Address.getAllByName("www.naver.com");  
			for(InetAddress remote : iaArr) {
				System.out.println("www.naver.com IP 주소 : " + remote.getHostAddress());
			}
		} catch (UnknownHostException e) {
			
			e.printStackTrace();
		}
		
   }
}