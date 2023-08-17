import React from "react";
import {createStore} from "redux";
import { Provider, useSelector, useDispatch } from "react-redux";
// 리덕스 작업
// 리덕스 툴킷 미사용 작업



// const state= {value: 0}
// const action = {type: 'up, step:2}
// 첫 실행시 state값만 존재하고, action은 없는 상태
function Reducer (state,action) {
    if(action.type === 'up') {
      return {...state, value:state.value + action.step};
    }
  return state; 
}

// state로 사용되는 데이터 유형: number, string, boolean, object, array 등이 사용가능.
const initialState = {value:0};
const store = createStore(Reducer,initialState);

function Counter() {
  const dispatch = useDispatch();
  const count = useSelector(state => state.value);

  return (
    <div>
      <button onClick={() => {
        // action 매개변수의 값으로 javascript의 obejct 문법 사용
        dispatch({type: 'up', step: 2}); 
      }} >증가</button> {count}
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
