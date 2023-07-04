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
const cars {type:BMW, model:5 serise, generation : 1};

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

------------------------------------------------------------------------------------------------

Syntax 
If문

Else 문

Switch 문

For 문

For In 문

For Of 문

While 문

Break 