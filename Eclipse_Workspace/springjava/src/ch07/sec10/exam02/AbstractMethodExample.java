package ch07.sec10.exam02;

public class AbstractMethodExample {
	public static void main(String[] args) {
//		Dog dog = new Dog();
//		dog.sound();
//		
//		Cat cat = new Cat();
//		cat.sound();
//		
//		Horse horse = new Horse();
//		horse.sound();
		
		animalSound(new Dog());
		animalSound(new Cat());
		animalSound(new Horse());
		
	}
//	매개변수의 다양성 Animal animal = new dog(), Animal animal = new Cat();
	public static void animalSound (Animal animal) {
		animal.sound(); // 재정의된 메소드 호출
	}
}
