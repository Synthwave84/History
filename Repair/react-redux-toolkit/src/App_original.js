import React from "react";
// import {createStore} from "redux";
import {createSlice, configureStore} from "@reduxjs/toolkit"
import { Provider, useSelector, useDispatch } from "react-redux";

// 리덕스 툴킷 사용 작업


// const state= {value: 0}
// const action = {type: 'up, step:2}
// 첫 실행시 state값만 존재하고, action은 없는 상태


// reducer 함수의 기능을 대신한다


const counterSlice = createSlice({
  // 1)slice를 구분하기 위한 유일한 이름이어야한다

  name: 'counterSlice', // Slice를 구분하기 위한 유일한 이름이어야 한다.
    // 2) state(상태)로 사용할 값. 타입=number,string,bool,obj,arr
  initialState: {value : 0}, // state(상태)로 사용할 값
  // 3) dispatch가 호출되면, 일치되는 이름으로 코드가 실행된다.
  // up,down이 함수(메소드)로 호출이된다. 예 up(action값), down(action값)
  reducers : { // 여기엔 s 가 들어가고,
      up: (state, action) => {
        // ... spread연산자도 사용하지 않아도 된다
        state.value = state.value + action.payload; 
      },
      down : (state, action) => {
        state.value = state.value - action.payload;
      }
  }
});

const store = configureStore ({
  reducer : { // 여긴또 안들어간다 지 맘대로다 아주
                counter : counterSlice.reducer}
});
// counterSlice,reducer중 {up,down}을 호출할떄 사용
function Counter() {
  // 제발 useDispatch할대 괄호좀 처 넣어라 새끼야
  // useSelector : state로 관리되는 현재값을 참조할 때 사용.
  // let state= {(counter: {value: 현재값})}
  const dispatch = useDispatch();
  const count= useSelector (state => {
    return state.counter.value
  });



  return (
    <div>
      <button onClick={() => {
        dispatch(counterSlice.actions.up(2)); 
      }} >증가</button>
      <button onClick={() => {
        dispatch(counterSlice.actions.down(2)); 
      }} >감소</button> {count}
    </div>
  )
}


function App() {
  return (
    <div>
      <Provider store={store}>
      <Counter>

      </Counter>
      </Provider>
  
    </div>
  );
}

export default App;
