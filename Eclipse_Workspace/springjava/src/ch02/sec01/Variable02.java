package ch02.sec01;

public class Variable02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int hour = 3;
		int minute = 5;
		// System.out.printLn() : 변수 또는 값을 콘솔에 출력시 사용하는 기능.
		System.out.println(hour+ "시간"+ minute + "분");
		
		// 3시간 5분중의 총 분?
		int totalMinute = (hour*60) + minute;
		System.out.println("총" + totalMinute+"분");

	}

}
