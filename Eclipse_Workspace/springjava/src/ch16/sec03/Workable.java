package ch16.sec03;

@FunctionalInterface
public interface Workable {
//	매개변수가 2개인 메소드를 람다식으로 재정의
	void work(String name, String job);
}
