package ch16.sec01;

//	인터페이스를 상속받는 클래스 = 구현 클래스
public class CalculableImpl implements Calculable{

	@Override
	public void calculate(int x, int y) {
		int result = x+y;
		System.out.println("result :" + result);
		
	}
	
	
}
