package Tester;

public class Sungjuk {
	
	private String[] name = {"홍길동","강호동","유재석","박명수"};
	private int[] kor = {60,70,80,90};
	private int[] eng = {75,80,55,100};
	
	public String[] getName() {
		return name;
	}
	public void setName(String[] name) {
		this.name = name;
	}
	public int[] getKor() {
		return kor;
	}
	public void setKor(int[] kor) {
		this.kor = kor;
	}
	public int[] getEng() {
		return eng;
	}
	public void setEng(int[] eng) {
		this.eng = eng;
	}
//	국어 총점 메소드
	public int getKorSum() {
		int sum= 0;
		for(int i=0; i<kor.length; i++) {
			sum+= kor[i];
		}
		return sum;
	}
//	영어 총점 메소드
	public int getEngSum() {
		int sum= 0;
		for(int i=0; i<eng.length; i++) {
			sum+= eng[i];
		}
		return sum;
	}
	
}
	
	
	

