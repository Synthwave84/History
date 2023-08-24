package ch02.sec08;

public class CastingExample {
public static void main(String[] args) {
//	강제 타입 변환 ( 명시적)
//	작은데이터타입 - (좌측타입명) 큰 데이터타입
	int var1 = 10;
	byte var2 =(byte) var1;
	System.out.println(var2); // 10
	
	int intValue = 10;
	byte byteValue = (byte) intValue;
	System.out.println(byteValue); 
	
	long var3= 300;
	int var4 = (int) var3;
	System.out.println(var4); // 300
	
	int var5 = 65;
	char var6 = (char) var5;	
	System.out.println(var6); // A
	
	double var7 = 3.14;
	int var8 = (int) var7;
	System.out.println(var8); // 원래값 3.14 반환값 3
	}
}
