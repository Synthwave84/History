import { useDispatch, useSelector } from "react-redux";
import {up} from "./counterSlice";
import {down} from "./counterSlice"; 





function Counter() {
  // 제발 useDispatch할대 괄호좀 처 넣어라 새끼야
  const dispatch = useDispatch();
  const count= useSelector (state => {
    return state.counter.value
  });



  return (
    <div>
      <button onClick={() => {
        dispatch(up(2)); 
      }} >증가</button>
      <button onClick={() => {
        dispatch(down(2)); 
      }} >감소</button> {count}
    </div>
  )
}

export default Counter;