import {createSlice} from "@reduxjs/toolkit"

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

export default counterSlice;
export const {up} = counterSlice.actions;
export const {down} = counterSlice.actions; 