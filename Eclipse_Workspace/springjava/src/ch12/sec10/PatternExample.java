package ch12.sec10;

import java.util.regex.Pattern;

// 정규식 예제 - 문자열데이터에 패턴검사를 하는 문법
public class PatternExample {
   
   public static void main(String[] args) {
      String regExp = "(02|010)-\\d{3,4}-\\d{4}"; // 02 혹은 010으로 시작  - d : 10진수, { 자릿수 }
      String data = "010-123-4567";
      boolean result = Pattern.matches(regExp, data);
      // String의 부모클래스는 CharSequence
      if(result) {
         System.out.println("정규식과 일치");
      } else {
         System.out.println("정규식과 일치하지 않습니다");
      }
      
      regExp = "\\w+@\\w+\\.\\w+(\\.\\w+)?"; // 전자우편 정규식
      data = "angel@mycompanycom"; // . 이 빠져있음을 인지.
      
      result = Pattern.matches(regExp, data);
      
      if(result) {
         System.out.println("정규식과 일치");
      } else {
         System.out.println("정규식과 일치하지 않음");
      }
      
      
      
   }
}