import React, {useState} from "react";






function Counter () {
// 자바스크립트 구문 삽입 위치.

// let count= 0;
// 카운트 기능을 담당할 구문
// const [number, setNumber] = useState(0);

// useState Hook은 Import에 useState 를 선언해야하며, 하단처럼 괄호에 초기값을 적어주어야한다.
// 이럴 시, 배열구조로 첫번째 괄호 내의 값인 초기값의 0을 저장하고, 두번째 요소는 초기값을 변경할 함수를 저장한다.
// 즉 초기 선언 시, 배열을 두개를 만든다.  
/*
useState(초기값) 구문이 동작되면, 2개요소를 갖는 배열 형태의 기억장소가 생성된다
[0] 첫번째 요소는 초기값을 갖게되는 기억장소가 되고, [1] 두번쨰 요소눈 set 기능을 하는 함수가 존재하게 된다.
set 기능은 [0] 첫번째 요소의 기억장소의 값을 변경하는 목적으로 만들어져있다.

(중요)
useState로 생성한 변수는,
useState 값이 변경된 것을 만족하려면
데이터를 갖는 변수는 값만 변경 시키고, 
주소를 갖는(배열,객체)변수는 주소를 변경시켜야 한다.
그래야 컴포넌트가 재 실행되고, 재 렌더링이 이뤄질 수 있다.
*/
/*
const numberState = useState(0);
const number = numberState[0];
const setNumber = numberState[1];
*/
console.log("렌더링")
// 상단 함수와 동일하다.
// useState 훅으로 생성된 기억장소는 값이 변경되면, 해당 컴포넌트(Counter)컴포넌트가 
// 다시 렌더링 되는 특징이 있다. 즉 값이 바뀔 때 마다 계속 새로 불러오기를 한다고 보면 된다.
// 이것이 매우 핵심이다. 
const [number, setNumber] = useState(0);

  const onIncrease = () => {
    /*
    count++;
    console.log(count);
    */
   // number = number +1; number는 읽기 용도로 변하고, number가 가리키는 기억장소의 변경작업은 
   // setNumber() 함수로 하게된다.
    setNumber(number+1);
  }

  const onDecrease = () => {
    /*
    count--;
    console.log(count);
    */
      setNumber(number-1);
  }


  return (
    <div>
      <h1>{number}</h1>
      <button onClick={onIncrease}>+1</button>
      <button onClick={onDecrease}>-1</button>
    </div>
  );
} 

export default Counter;