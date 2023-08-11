import React, {useReducer} from "react";

/*
상태관리를 목적으로 하는 Hook
- useState
- useReducer

*/ 

// useReducer 예제. 
function App_Reducer() {
  // 일반변수
  //let count = 0;

// 비지니스 로직의 함수로 외부, 파일 형태로 관리할 수 있으며, 고로 재사용이 가능하다
  function countReducer(oldCount, action) {
    if(action === 'up') {
      return oldCount +1;
    }else if(action === 'down') {
      return oldCount-1;
    }else if(action === 'reset') {
      return 0; 
    }
    
  }

  // 리듀스함수 : 회계직원 , 상태변수 초기값);
  //  const [state변수, 사용자가 사용할 변수값] = 상태변수 초기값();
  const [count, countDispatcher] = useReducer(countReducer, 0);
  
  // 일반 유저가 호출할 함수.  countDispatch -> countReducer 호출
  function up() {
    countDispatcher('up'); // countReducer(oldCount, action) 호출 :count -> oldCount에 전달.
  }

  function down() {
    countDispatcher('down'); // countRexducer(oldCount, action) 호출
  }

  function reset() {
    countDispatcher('rest'); // countRexducer(oldCount, action) 호출
  }


  
  return (
    <div>
      <input type="button" value="-" onClick={down} ></input>
      <input type="button" value="0"onClick={reset}></input>
      <input type="button" value="+" onClick={up}></input>
      <span>{count}</span>
    </div>
  );
}

export default App_Reducer;