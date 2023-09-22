package Testera;

import java.util.Arrays;

public class SunjukMain {
	public static void main(String[] args) {
	Sungjuk sungjuk = new Sungjuk();
	
	System.out.printf("이름 %s ", Arrays.toString(sungjuk.getName()));
	System.out.println();
	System.out.printf("국어점수 %s", Arrays.toString(sungjuk.getKor()) +" 합계 :" +
	sungjuk.getKorSum());
	System.out.println();
	System.out.printf("영어점수 %s", Arrays.toString(sungjuk.getEng())+" 합계 : " +
	sungjuk.getEngSum());
	}
}
