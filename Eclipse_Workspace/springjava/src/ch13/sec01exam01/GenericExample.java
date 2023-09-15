package ch13.sec01exam01;

public class GenericExample {
	public static void main(String[] args) {
		Product<Tv, String> product1 = new Product<>();
		
		product1.setKind(new Tv());
		product1.setModel("Smart TV");
		
		Tv tv = product1.getKind();
		String tvModel = product1.getModel();
		// product2 객체 <Car, String>
		// 모델 :SUV 자동차.
		
		Product<Car, String> product2 = new Product<>();
		
		product2.setKind(new Car());
		product2.setModel("SUV자동차");
		Car car = product2.getKind();
		String carModel = product2.getModel();
		
		Product<Airconditioner, String> product3 = new Product<>();
		product3.setKind(new Airconditioner());
		product3.setModel("Whisen");
		Airconditioner aircon = product3.getKind();
		String airConModel = product3.getModel();
//		제네릭을 사용하지 않으면, 타입이 Object 클래스로 관리된다.
		Product product = new Product();
	}
}
