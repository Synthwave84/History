package ch12.sec11.exam02;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectionExample {
	public static void main(String[] args) {
//		리플렉션 작업을 지원하는 클래스 : Class
		Class clazz = Car.class;
		
		System.out.println("[생성자 정보]");
		Constructor[] constructors =  clazz.getDeclaredConstructors();
		for(Constructor constructor : constructors) {
			System.out.println(constructor.getName() + "( ");
			Class[] parameters = constructor.getParameterTypes();
			printParameters(parameters);
			System.out.print(" )");
			}
			System.out.println();
			
			System.out.println("[필드정보]");
			Field[] fields = clazz.getDeclaredFields();
			for(Field field : fields) {
				System.out.println(field.getType().getName() + " " + field.getName());
			}		
				
			System.out.println();
			
			System.out.println("[메소드 정보]");
			Method[] methods = clazz.getDeclaredMethods();
			for(Method method : methods) {
				System.out.print(method.getName() + "( ");
				Class [] parameters = method.getParameterTypes();
				printParameters(parameters);
				System.out.println(" )");
			}
			
		}
	
	
	private static void printParameters(Class[] parameters) {
		for(int i=0; i<parameters.length; i++) {
			System.out.print(parameters[i].getName());
			if(i<parameters.length-1) {
				System.out.print(",");
			}
			
	}
			
			
			
		}
		
	}
	

