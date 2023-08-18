//  import React, {useState} from 'react'
import {createStore} from 'redux';
import { Provider, useSelector, useDispatch  } from 'react-redux';
import "./style.css"

//  https://velog.io/@404/%EB%A6%AC%EB%8D%95%EC%8A%A4-0.-%EB%A6%AC%EB%8D%95%EC%8A%A4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80


// ContextAPI 사용방식이 개선되기 전 (버젼업 전), useReducer Hook 
// 나오기 전에 존재하는 라이브러리
// 상태관리 라이브러리 

// 리덕스 = 리액트와 상관없이 독립적인 형태를 가지고있다.
// 리액트 프로젝트 : 리덕스, 리액트 리덕스 패키지를 함께 설치해야 한다.
// npm install reduc react-redux


// redux 사용예제
// 공유 데이터를 특정 함수 컴포넌트에서 사용.
// store : 상태 관리를 전문적으로 하는 곳.

// 상태관리를 하는 함수 : 요청을 받아 값을 변경하는 
// return 되는 값이 상태관리로 사용되는 데이터. 
// 예를들면  const [currentState, setCurrentstate] = useState({number : 1})]
// useSelector 를 사용하게되면 -> reducer 함수가 동작된 state 값을 참조할 수가 있다. 



// Reducer : 현재 상태(state)와 액션 객체를 받아 새로운 상태(state)를 리턴하는 함수.
// 동작: 처음 렌더링 될때, 호출 Dispatcher 부터 호출한다.
// 리턴값이 state 값으로 변경되어, 다시 랜더링된다.
// let action = { type : 'PLUS' } action. type 구문으로 호출하여 PLUS 값을 읽어옴;
function Reducer (currentState, action) {
  // 처음에 참조됨. 
  // 현재 상태는 1이다. 왜냐면 action이 없기 때문이다.
  if(currentState === undefined) {
    return { number : 1 };
  }
  // currentState= {number :1}로 처리가 된다.
  // 위의 리턴되는 state 값이 currentState로 관리 된다. 
  // 그리고 object타입이기 때문에 스프레드 연산자를 사용한다.

  console.log("currentState", currentState);
  const newState = {...currentState}; // spread 연산자 : 복제기능
    // newState = {number : 1} 
    // const newState =  {number :1} 을 복제.
  if(action.type === "PLUS") {
    newState.number++; // {number : 2}
  }else if (action.type ==="MINUS") {
    newState.number --;
  }
    return newState; // 리턴되는 state 값이 currentState로 참조 된다. 
}
// store : 컴포넌트의 상태를 관리하는 저장소이다. 
// 프로젝트에서 스토어는 1개만 생성 할 수 있다. 

//  1단계 - Reducer 함수 작업이 선행되어야 한다. 
const store = createStore (Reducer); // Reducer함수가 참조한다. 
function App() {
  return (

    <div id="container">
      <h1>Root : </h1>
      <div id="grid">
        {/* store가 사용될 함수 컴포넌트에 아래 작업을 해 줘야 한다.  */}
        {/* 즉 리덕스를 사용할 것들을 프로바이더(제공자)로 감싸주는것이다. */}
      <Provider store={store}>
      <Left1></Left1>
      <Right1 ></Right1>
      </Provider>
      </div>
    </div>
  );
}

// let porps = (number : number); props.number;
function Left1() {
  return (
    <div>
      <h1>Left1 :</h1>
      <Left2></Left2>
    </div>
  );
}

function Left2() {
  return (
    <div>
      <h1>Left2 : </h1>
      <Left3></Left3>
    </div>
  );
}


function Left3() {

  // 3단계. 실제 reducer 함수가 동작되어 return된 값을 state 변수값으로 참조한다.
  // Dispatcher로부터 Reducer 함수가 동작되어 return 된  state 값을 state 변수값으로 참조한다.
  const number = useSelector((state) => state.number);
  return (
    <div>
      <h1>Left3 : {number}</h1>
    </div>
  );
}

function Right1() {
  return (
    <div>
    <h1>Right1 : </h1>
    <Right2></Right2>
    </div>
  );

}
function Right2() {
  return (
    <div>
    <h1>Right2 : </h1>
    <Right3></Right3>
    </div>
  );

}
function Right3() {
  // Dispatch : 스토어의 내장함수. 액션(action)객체를 넘겨서 state를 업데이트 시켜주는 기능 
  // 4단계 : state 변경작업을 Reducer() 함수에게 요청.
  const dispatch = useDispatch();
  return (
    <div>
    <h1>Right3 : </h1>
    <input type='button' value="증가" onClick={() => {
      // type키는 필수.Reducer()함수 호출. 함수 호출 시, object값이 action으로 전달.
        dispatch({type:"PLUS"}) 
    }} /> 
    <input type='button' value="감소" onClick={() => {
      // type키는 필수.Reducer()함수 호출. 함수 호출 시, object값이 action으로 전달.
        dispatch({type:"MINUS"}) 
    }} /> 
    </div>
  );

}



export default App;
