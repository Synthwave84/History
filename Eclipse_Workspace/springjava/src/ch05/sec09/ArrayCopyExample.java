package ch05.sec09;

public class ArrayCopyExample {
	public static void main(String[] args) {
		
//		배열 복사 = system.arraycopy() 메소드를 이용.
		String[] oldStrArray = {"java","array","copy"	};

//		길이가 5인 사본배열
		String[] newStrArray = new String[5];
		
//		배열 복사
//		마지막은, 데이터의 갯수를 정한다. 숫자도 될 수 있고 length도 될 수 있다
//		참조타입의 초기값은 null로 설정되어있다.
		System.arraycopy(oldStrArray, 0, newStrArray, 0, oldStrArray.length);
		
//		배열 항목 출력 작업
		for(int i=0; i<newStrArray.length; i++) {
			System.out.println(newStrArray[i]+",");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
