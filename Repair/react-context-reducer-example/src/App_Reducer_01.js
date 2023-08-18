import React, {useState} from "react";

/*

상태관리의 필요 이유.
리액트에서는 일반 변수를 통하여, 값을 변경하였을 때 함수 컴포넌트가 재 실행되지 않기 때문에,
결과적으로 UI코드가 재 렌더링이 이루어지지 않아 변수의 변경된 값을 브라우저 화면에서
반영하여 볼 수가 없다.

상태관리를 목적으로 하는 Hook
- useState
- useReducer

*/ 


function App_Reducer() {
  // 일반변수
  // let count = 0;

  const [count, setCount] = useState(0);

  function up() {
    // count = count + 1;
    setCount(count+1);
  }

  function down() {
    // count = count - 1;
    setCount(count-1);
  }

  function reset() {
    console.log("count", count);
    // count = 0;
    setCount(0);
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