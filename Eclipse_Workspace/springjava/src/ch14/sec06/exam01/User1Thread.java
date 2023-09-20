package ch14.sec06.exam01;

//	스레드로 사용할 클래스
public class User1Thread extends Thread {
	private Calculator calculator;
	
	public User1Thread() {
		setName("User1Thread");
	}
//	100 번지
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}

	@Override
	public void run() {
		calculator.setMemory1(100);
	}
	
	
	
	
	
}
