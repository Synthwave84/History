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
  name: 'counterSlice', // Slice를 구분하기 위한 유일한 이름이어야 한다.
  initialState: {value : 0}, // state(상태)로 사용할 값
  reducers : {
      up: (state, action) => {
        state.value = state.value + action.payload;
      },
      down : (state, action) => {
        state.value = state.value - action.payload;
      }
  }
});

const store = configureStore ({
  reducer : {
    counter : counterSlice.reducer
  }
});

function Counter() {
  // 제발 useDispatch할대 괄호좀 처 넣어라 새끼야
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
