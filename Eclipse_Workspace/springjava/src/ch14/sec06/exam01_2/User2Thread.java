package ch14.sec06.exam01_2;

//	스레드로 사용할 클래스
public class User2Thread extends Thread {
	private Calculator calculator;
	
	public User2Thread() {
		setName("User2Thread");
	}
//	 100번지
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}

	@Override
	public void run() {
		calculator.setMemory1(50);
	}
	
	
	
	
	
}
