package ch15.sec06.exam01;

import java.util.Stack;

public class StackExample {
	public static void main(String[] args) {
//		LIFO : 후입선출  예시 > 브라우저의 위로/ 앞으로
		Stack<Coin> coinBox = new Stack<Coin>();
	
//		동전 넣기
		coinBox.push(new Coin(100));
		coinBox.push(new Coin(50));
		coinBox.push(new Coin(500));
		coinBox.push(new Coin(10));
		
//		동전을 하나씩 꺼내기
		
		while (!coinBox.isEmpty()) {
			Coin coin = coinBox.pop();
			System.out.println( "꺼내온 동전 :"  +coin.getValue()+"원");
		}
	}
}
