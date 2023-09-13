package ch12.sec08;

import java.util.Calendar;
import java.util.TimeZone;

//	미국 LA 시간 읽어오기
public class LosAngelesExample {
	public static void main(String[] args) {
		
		TimeZone timeZone = TimeZone.getTimeZone("America/Los_Angeles");
		Calendar now = Calendar.getInstance(timeZone);
		
		int amPm = now.get(Calendar.AM_PM);
		String strAmPm= null;
		if(amPm == Calendar.AM) {
			strAmPm= "오전";
		}else {
			strAmPm="오후";
		}
		
		int hour = now.get(Calendar.HOUR);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		
		System.out.println(strAmPm + "");
		System.out.println(hour +"시");
		System.out.println(minute+ "분");
		System.out.println(second+ "초");
		
		
	}
}
