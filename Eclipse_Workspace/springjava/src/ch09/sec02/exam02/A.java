package ch09.sec02.exam02;

public class A {
   
   // instance member class
   // instance member field, method는 가능.
   // 단 Java 17에서는 static member field, method 허용
   class B {
      // instance field
      int field1 = 1;
      
      // constructor
      B() {
         System.out.println("B-생성자 실행");
      }
      
      // instance method
      void method1()  {
         System.out.println("B-method1 실행");
      }
      
      // static field(java 17부터 허용)
      // static int field2 = 2;
         
   }

   // instance method
   void useB() {
      B b = new B();
      System.out.println(b.field1);
      b.method1();
      
      // Java 17에서 호출 가능
//      System.out.println(B.field2);
//      B.method2();
   }
}