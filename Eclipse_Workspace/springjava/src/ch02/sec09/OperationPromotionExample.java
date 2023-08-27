package ch02.sec09;

public class OperationPromotionExample {
public static void main(String[] args) {
	/*
	 *정수, 실수데이터 타입으로 형변환 (casting)
	 * 
	 */
	
	
	
	byte result = 10 + 20;
	
	System.out.println("result : " + result);
	
	byte v1= 10;
	byte v2= 20;
//	연산을 진행하게 되면 내부적으로 int로 변환이 된다.
//	byte result2 = v1 + v2;
	int result2= v1+v2;
	System.out.println("reslult 2 : " + result2);
	
//	다른 데이터타입끼리 연산시 가장 큰 데이터타입으로 형변환이 발생된다.
	byte v3= 10;
	int v4 = 100;
	long v5 = 1000L;
	long result3 = v3+ v4+ v5;
	System.out.println("result3 : " + result3);
	
	
	char v6= 'A';  //유니코드 값 65
	char v7= 1; // 유니코드 값 1
	int result4 = v6 + v7; // int타입으로 변환 후 환산
	System.out.println("result4 : "+ result4);
	System.out.println("result4 : " + (char) result4);
	
	int v8= 10;
	int result5 = v8 / 4;
	
	System.out.println("result5 : " + result5);
	int v9 = 10;
	double result6 = v9 / 4.0; // 4.0 double 실수 데이터타입. int->double 변환
	System.out.println("Result6 : " +  result6);
	
	int v10 = 1;
	int v11 = 2;
	double result7 = (double) v10 / v11;
	
	System.out.println(result7);
	
	}
}
