package ch16.sec03;

@FunctionalInterface
public interface Speakable {
//	매개변수가 1개 있는 람다식으로 재정의
	void speak(String content);
}
