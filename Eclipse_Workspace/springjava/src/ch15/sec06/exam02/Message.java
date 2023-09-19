package ch15.sec06.exam02;

//	Queue 자료구조에 사용될 클래스
public class Message {
	public String command;
	public String to;
	
	public Message(String command, String to) {
		this.command = command;
		this.to = to;
	}
}
