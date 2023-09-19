package ch16.sec01;

// 	함수형 인터페이스에 추상 메소드를 람다식 문법으로 재정의 하여
//	인터페이스 매개변수에 대입하는 형태

			
public class LambdaExample {
	public static void main(String[] args) {
		
//		람다식 문법을 사용하지 않고, 기본으로 표현한 형태
//		Calculable calculable = new CalculableImpl();
//		calculable.calculate(10, 20);
			
//		람다식 문법
		action((x,y) ->{
			int result = x+y;
			System.out.println("result :" + result);
		});
		
		action((x,y) -> {
			int result = x -y;
			System.out.println("result : " + result);
		});
	}

//	Calculable 인터페이스의 추상 메소드 void calculate (int x, int y)
//	
//	void calculate(intx, int y) {
//		int result = x + y;
//		System.out.println("result:" + result);
//	}
	
	
	private static void action(Calculable calculable) {
		
//		데이터
		int x = 10;
		int y = 4;
		
//		데이터 처리
		calculable.calculate(x, y);

	}
}
