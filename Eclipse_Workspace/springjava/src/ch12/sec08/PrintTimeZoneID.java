package ch12.sec08;

import java.util.TimeZone;

//	각 지역(도시)별 시간대를 확인하기 위한 타임존 정보.
public class PrintTimeZoneID {
	public static void main(String[] args) {
		String[] availableIDs = TimeZone.getAvailableIDs();
		for(String id : availableIDs) {
			System.out.println(id);
		}
	}
}
