package ch12.sec11.exam03;



//	리플렉션을 통한 리소스 참조하기
public class GetResourceExample {
	
	public static void main(String[] args) {
		Class clazz = Car.class;
		
		String photo1Path = clazz.getResource("photo1.jpg").getPath();
		String photo2Path = clazz.getResource("images/photo2.jpg").getPath();
//		src 폴더에 위치해 있는것이 아니라 bin 위치에 있다.
//		컴파일 하면서, bin 내부에 복제된 파일을 생성한다.
		System.out.println(photo1Path);
		System.out.println(photo2Path);
		
		
	}
}
