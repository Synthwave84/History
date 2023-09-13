package ch12.sec08;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateExample {
	public static void main(String[] args) {
//		시스템의 현재 날짜, 시간정보
		Date now = new Date();
		String strNow1 = now.toString();
		System.out.println(strNow1);
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strNow2 = sdf.format(now);
				System.out.println(strNow2);
	}
}
