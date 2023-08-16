//  import React, {useState} from 'react'
import {createStore} from 'redux';
import { Provider, useSelector, useDispatch  } from 'react-redux';
import "./style.css"

//  https://velog.io/@404/%EB%A6%AC%EB%8D%95%EC%8A%A4-0.-%EB%A6%AC%EB%8D%95%EC%8A%A4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80


// redux 사용예제
// 공유 데이터를 특정 함수 컴포넌트에서 사용.
// store : 상태 관리를 전문적으로 하는 곳.

// 상태관리를 하는 함수 : 요청을 받아 값을 변경하는 
// return 되는 값이 상태관리로 사용되는 데이터. 
// 예를들면  const [currentState, setCurrentstate] = useState({number : 1})]
// useSelector 를 사용하게되면 -> reducer 함수가 동작된 state 값을 참조할 수가 있다. 
function Reducer (currentState, action) {
  if(currentState === undefined) {
    return {
      number : 1
    };
  }
  const newState = {...currentState}; // spread 연산자 : 복제기능
  
  if(action.type === "PLUS") {
    newState.number++;
  }
    return newState;
}
//  1단계 - Reducer 함수 작업이 선행되어야 한다. 
const store = createStore (Reducer);
function App() {
  return (

    <div id="container">
      <h1>Root : </h1>
      <div id="grid">
        {/* store가 사용될 함수 컴포넌트에 아래 작업을 해 줘야 한다.  */}
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
  const number= useSelector((state) => state.number);
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
  // 4단계 : state 변경작업을 Reducer() 함수에게 요청.
  const dispatch = useDispatch
  return (
    <div>
    <h1>Right3 : </h1>
    <input type='button' value="증가" onClick={() => {
        dispatch({type:"PLUS"}) // type키는 필수.Reducer()함수 호출.
    }} /> 
    </div>
  );

}



export default App;
