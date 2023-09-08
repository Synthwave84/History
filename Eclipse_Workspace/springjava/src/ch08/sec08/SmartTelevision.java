package ch08.sec08;

public class SmartTelevision implements RemoteControl,Searchable {
	
	@Override
	public void search(String url) {
		// TODO Auto-generated method stub
		System.out.println(url + "을 검색합니다");
	}
	@Override
	public void turnOn() {
		System.out.println("TV를 켭니다");
		
	}@Override
	public void turnOff() {
		System.out.println("TV를 끕니다");
		
	}
}
