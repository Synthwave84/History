package ch02.sec06;

public class TextBlockExample {

	public static void main(String[] args) {
			
		String str = "" + 
				"{\n"+
				"\t\"id\"winter\",\n"+
				"\t\"name\": \"눈송이\"\n" +
				"}";
		
//		자바 13 부터 지원 하는 텍스트블록 문법. 현재 java8(jdk1.8)에서는 에러가 난다.
//		String str2 = """"
//				{
//						"id":"winter",
//						"name":"눈송이"
//				}
//			"""";
		System.out.println(str);

	}

}
