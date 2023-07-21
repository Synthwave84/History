Table = tr th td 로 나뉘고, table tr로 row td로 내부 divide
th= 헤더. 자동 볼드처리 + 가운데정렬 display 타입이 inline 일 경우에는 height width 옵션이 먹지 않음.

추가적으로 inline-block 등의 inline에 추가 옵션이 들어간 경우에는 먹음.

Float = 내가 설명문 쓸때 필요함. 
Float는 그냥 그 자리를 차지하고 떠있는거라 화면에 표기되는것에 영향을 주지 않음. 
이미지를 추가하고 이미지는 인라인으로 처리가 되나, 이미지 옆 쪽에 글을 적는것이 불가능 했을때의 솔루션으로 작용 할 수 있음.

데이터 형식
 - 숫자 : 10, 0, ... 실수 -10.5 10.5 etc...
 - 문자 : ',' or "," 로 감싼다. "10"은 문자열로 인식
 - 논리 : true / false 

데이터 보관 :  Memory
기억장소를 가리키는 이름 : 변수

변수를 만드는 기능.
let 이름; (세미콜론을 꼭 사용하도록한다.)

ex) let x;
     x = 10;
     이렇게 하면 x의 변수에 10이 지정된다. 

만약 변수값을 이중으로 지정을 하게 되면 하단에 있는것을 주로 인식하게된다.

ex) let x;
     x = 10;
     x = 20; 
     이러할 경우 변수 x의 값은 20이 된다. 

비트연산
비트연산은 각 이진법 0과 1을 false/true 로 이해하면된다.

AND 
0101 & 0001 = 1 
0101 > false true false true
0001 > false false false true
------------------------------------
0001 > false false false true

OR 도 동일하다.
0101 | 0001 = 5
0101 > false true false true
0001 > false false false true
------------------------------------
0101 > false true false true

NOT 의 경우 값을 반대로 치환하기때문에 값이 뒤바뀐다.
0101 > false true false true
------------------------------------
1010 > true false true false

XOR (eXclusive OR) = 값이 다를 경우에만 true로 치환된다.
0101 ^ 0001 
0101 > false true false true
0001 > false false false true
------------------------------------
0100 > false  true false false

Shifting
Left Shift "<<"
0101 << 1 => 1010 = 한쪽씩 비트를 왼쪽으로 이동한다.
Right Shift ">>"
0101 >> 1 => 0010 = 한쪽씩 비트를 오른쪽으로 이동한다.
--- 한칸씩 밀릴때 빈 공간은 0 으로 삽입된다.

과학적 표기법.
123e5 = 123* 10의 5승 이라고 보면 된다. e=Exponential 
= 1230000
123e-5 = 123* 10의 -5승 이라고 보면 된다. 때문에 123에서 5자리를 소숫점으로 치환한다.
= 0.00123

--------------------------------------------------------------------------------------------
매우 중요한 것 
* 데이터를 어떠한 기억장소로 사용 할 것인가!

변수 = 공통점이 아예 없는 경우에 각각의 값을 변수 지정 
사과 = 과일
호랑이 = 동물
핸드폰 = 기계

Object = 특정한 개체에 대한 상세한 정보 또는 설명
ex - 사과. = 타입: 과일, 색상:빨강 맛:새콤달콤
Arrays = 성격이 같은 것에 대한 목록으로 구분 할 수 있다.
ex - 과일 = 사과,바나나,딸기 etc

------------------------------------------------------------------------------------------
Object와 Arrays의 
Object / Arrays 의 구분

Object는 쉽게 설명하면 각 제품의 특징에 대해서 기술할때 주로 쓰인다.
const cars {type: "BMW", model:5 serise, generation : 1};

Arrays는 같은 틀 안에 있는 집합을 목록화 할 때 주로 사용한다.
const maker ["BMW","VOLVO","BENZ","AUDI","HYUNDAI"];

Object의 경우는 {} 중괄호로 묶는다.
Array의 경우는 [] 대괄호로 묶는다.
Object의 경우 상단의 각각 데이터를 불러오려면 이런식으로 불러오게된다.
cars{"name"}, cars{"model"}, cars{"generation"}

Array의 경우 상단의 각각 메이커를 불러오려면 이런식으로 불러오게된다.
maker [0] = BMW
maker [1] = VOLVO

단점의 예시.
const person ["홍길동",100,"서울"]
여기서 person[0] 을 불러오면 홍길동이 불려오게 되지만, 타입이 다르므로 큰 혼선을 야기할 수 있다.

-------------------------------------------------------------------------------------
Math.~~
Math는 Bigint값은 지원하지않고 Number 값만 지원한다.

Math 메소드
Math.round() = 가운데 소숫점을 기준으로 반올림한다.
Math.round(3.6)=4

-------------------------------------------------------------------------------------

Syntax 
If문

필수적으로 if (condition) < 꼭 True or False 를 확인할 수 있는 코드를 넣어야한다.
condition이 true 일 때 {} 중괄호 내부에 있는 코드가 동작한다.

Else 문

Switch 문

For 문

For In 문

For Of 문

While 문

Break 


--------------------------------------------------------------------------------
객체 : 명령어가 속성과 메소드로 구성이 되어있다.
- 속성 : 명사 
     값을 관리한다.
- 메소드 : 동사
     기능 : 동작 또는 행위.

- 객체 : 내장 객체와 브라우저 객체로 분류
https://velog.io/@kim_unknown_/JavaScript-Objects

변수 : 기억장소를 가리키는 이름.

- 단순 데이터(숫자,문자열)를 저장하는 기억장소를 가리키는 이름 : 일반 변수.
- 데이터가 구조적으로 되어있는 기억장소를 가리키는 이름 : 객체 변수.
     명령어 2가지로 구분이 된다. 객체,속성(필드, 변수)
     객체.메소드()


     음식을 예시로 든다. 
     음식 = 기능
      -재료 = 속성(필드, 변수) 즉 데이터를 의미한다.
      -레시피 = 메소드()

     데이터를 관리하는 기억장소의 방법
     - 변수
     - 배열
     - object

     클래스의 구성요소
     - 변수, 배열, object등을 이용하여 내용을 구성. 

     클래스의 기본 문법
     class 클래스명 {
          constructor(매개변수1,매개변수2) {
               this.필드(속성)=매개변수1;
               this.필드(속성)=매개변수2;
          }
          메소드() {}
     }

     - 사용
const 이름1 =new 클래스명();
const 이름2 =new 클래스명();
const 이름3 =new 클래스명();

변수
 - 변수 안에 데이터가 존재
     let count = 10;
 - 변수 안에 데이터가 존재하는 기억장소의 주체가 존재
     person = {name:"john", age:31 city:"New York"} 여기서 변수는 "name" 이 되는것



navigator : 사용자의 브라우저 정보를 확인할 때 사용한다.
      쿠키지원 여부 확인 : navigator.cookieEnabled
      대부분의 브라우저는 쿠키기능을 지원한다.

---------------------------------------------------------------------------------------------------

이벤트 : 웹브라우저 화면에서 마우스 또는 키보드에 의한 행위를 이벤트 라고 칭한다. 

이벤트 설정
- 태그의 속성으로 이벤트 설정
     <input type="button" onclick="함수();">
- HTML DOM을 이용한 이벤트 설정
     ex>  유형1 - <button onclick="자바스크립트 코드">버튼</button>
          유형2 - <button id="btn">버튼</button>
                  document.getElementById("btn").onclick =  자바스크립트 코드;
          유형3 - 
- 캡쳐링 : 버블링과 캡쳐링이 있다. 버블링은 각 요소를 클릭 우선으로 진행되고,
          캡쳐링은 각 요소의 부모 객체부터 호출 후에, 이후 클릭된 요소가 순차적으로 실행된다.
          기본값은 false로 구성이 되어있는데 false = 버블링 이다.
          만약 맨 뒤로 이벤트내에서 true로 두면 ex) doc.adelistn("click",function,true);
          부모 태그 부터 실행이 되는 것이다.
스타일 설정
- 태그의 속성으로 스타일 설정
     <p style="color:red;">자바</p>

- 선택자
- css 파일

callback 함수

https://sangminem.tistory.com/275

동기 (Synchronous)
비동기 (Asynchronous)

let 변수명 = new 생성자함수();
- 생성자 함수 : 내장 명령어, 사용자 정의
예> 
     let d = new Date();
     let a = new Promise();

     동기
     A ()
     B ()
     C ()

     A > B > C

     비동기

     A()
     B()-비동기.B()가 완료되는 것과 상관 없이, C()가 진행된다.
     C()
--------------------------------------------------------------------------------------------
Markup Language

HTML  
          - 웹페이지(웹문서) 제작 언어.
          - 기본 구성 및 내용.

XML 
          - 환경설정 및 메타데이터, 프로그램의 기본 구성정보 및 
          - 데이터 교환 포멧

MIME 타입 
          - 웹페이지에서 자료포멧을 알려줄 때 쓰는 구문.
          웹페이지는 자료가 무엇인지 확장자로 알 수 없다. 그래서 따로 구문을 말 해주어야 한다.
          파일을 사용할 때, MIME값을 찾아야한다. JSON을 예로 들면
          application/json 으로 표기한다.

 XML은 루트가 단 하나만 있어야 한다. 마치 HTML의 <html></html>와 동일하다.
 Spring의 mybatis 등에서 사용한다. 소규모의 데이터 저장용 포멧으로 사용되는 듯 하다.

 XML은 다른 시스템 끼리의 데이터 전송에도 사용되는 표준 문서 같은 개념이다.
 근데요즘인기가없다 ㅠㅠㅠ 

 요즘은 JSON을 더욱 더 많이 쓴다. 비슷한 성격이나 자바스크립트로 이루어져있다.

 JSON

 JSON의 구조
 JSON의 구조는 object 구조와 비슷하다.
 첫 이름은 JSON의 이름이 되고, 그 이후에 정의를 하는 부분은 Key 라고 한다. 
 Key + Value


Object
 (type."Fiat", Model:"500");

json 구조

{"firstName":"John", "lastName":"Doe"};
- 데이터는 name:value 쌍형태의 구조이다.
- 데이터와 데이터는 , (comma)로 구분한다.
- object 데이터는 {} 중괄호를 입력해야한다.
- array 데이터는 [] 대괄호로 표현한다.



JSON에서 넣을 수 있는 자료들

stirng
number
object
boolean
null

예시
{"이름":값}
{ "name" : value };
값

string
{"name" : "김정웅"};

number
{"name" : 10};

object 
{"name" : { "id" : "USER01" } };

array 
{"name" : ["정웅", "웅쨩"]} 숫자일 시 - {"name" : [1, 2, 3]};

boolean 
{"name" : true };

null 
{"name" : null};

다음 데이터 들은 문자열로 감싸주어야한다.

function
date
undefined

예시

function  
{"name" : "function () {}"}

date 
{"name" : "2023-07-21" }

undefined 
{"name" : "undefined"}

저장 시 확장자는 *.json이 된다.

JSON에 넣을 수 없는 자료
function
date -> 날짜는 모두 그냥 스트링처리해버린다.
undefined
--------------------------------------------------------------------------------------------
AJAX

AJAX기술은 기존의 소스를 유지한 채로 지정한 위치만 바꾸는 기술이다.
자바스크립트 + 브라우저의 기능으로 지원이 된다. 
기존 설계된 틀의 자원과 코드를 낭비하지 않기 위해 사용된다.


HTML 상태 코드
status :200 ok : true = 서버에서 통신이 잘 되었다. 