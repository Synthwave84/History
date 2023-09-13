package ch12.sec08;

import java.util.Calendar;

public class CalendarExample {
	public static void main(String[] args) {
		
//		추상 클래스 객체 생성 불가능
		Calendar now = Calendar.getInstance();
		
		
//		날짜, 시간의 부분 정보 : Caleandar.상수명
//		년도
		int year = now.get(Calendar.YEAR);
//		월
		int month = now.get(Calendar.MONTH) +1;
//		일
		int day = now.get(Calendar.DAY_OF_MONTH);
//		요일	
		int week= now.get(Calendar.DAY_OF_WEEK);
		
		
		
		String strWeek = null;
		switch(week) {
		case Calendar.MONDAY: strWeek = "월"; break;
		case Calendar.TUESDAY: strWeek = "화"; break;
		case Calendar.WEDNESDAY: strWeek = "수"; break;
		case Calendar.THURSDAY: strWeek = "목"; break;
		case Calendar.FRIDAY: strWeek = "금"; break;
		case Calendar.SATURDAY: strWeek = "토"; break;
		default: strWeek= "일";
		}
		int amPm = now.get(Calendar.AM_PM);
		String strAmPm = null;
		if(amPm == Calendar.AM) {
			strAmPm= "오전";
		}else {
			strAmPm= "오후";
		}
		
		int hour = now.get(Calendar.HOUR);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		
		System.out.println(year+ "년" );
		System.out.println(month + "월" );
		System.out.println(day + "일" );
		System.out.println(strWeek+ "요일" );
		System.out.println(strAmPm+ "" );
		System.out.println(hour + "시" );
		System.out.println(minute+ "분" );
		System.out.println(second + "초" );
	}
}
