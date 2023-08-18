import counterSlice from "./counterSlice";  
import {up} from "./counterSlice";
import {down} from "./counterSlice";   // < 이 방식으로도 가능하다.
import { useDispatch, useSelector } from "react-redux";


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
        // dispatch(up(2)); 
      }} >증가</button>
      <button onClick={() => {
        dispatch(counterSlice.actions.down(2)); 
        // dispatch(down(2)); 
      }} >감소</button> {count}
    </div>
  )
}

export default Counter;