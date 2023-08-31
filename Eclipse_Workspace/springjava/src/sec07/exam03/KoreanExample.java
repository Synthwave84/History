package sec07.exam03;

public class KoreanExample {
	public static void main(String[] args) {
		
		Korean K1 = new Korean( "홍길동", "123456-1234567");
	
		
//		연예계에 입문을 해버림
		K1.name = "GD";
		
		System.out.println("K1.nation : " + K1.nation);
		System.out.println("K1.name : " + K1.name);
		System.out.println("K1.ssn : " + K1.ssn);
		System.out.println();
		
		Korean K2 = new Korean("태양", "654321-7654321");
		
		System.out.println("K2.nation : " + K2.nation);
		System.out.println("K2.name : " + K2.name);
		System.out.println("K2.ssn : " + K2.ssn);
		
	}
}
