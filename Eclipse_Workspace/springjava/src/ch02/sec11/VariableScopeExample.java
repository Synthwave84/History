package ch02.sec11;

public class VariableScopeExample {
	public static void main(String[] args) {
//		변수 사용 범위
//		블록 {} 안에 선언된 변수는 블록 밖에선 사용할 수 없다.
		
		int v1=15;
		if(v1>10) {
			int v2 = v1- 10; // 지역변수
			
			System.out.println(v2);
		}
//		int v3= v1 + v2 + 5;  v2 변수는 사용할 수가 없다. 
		
	}
}
