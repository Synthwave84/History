import React, {useReducer, useState} from "react";

/*
상태관리를 목적으로 하는 Hook
- useState
- useReducer
*/

// useReducer 응용예제
function App_Reducer() {
    /*
    const [state변수, 사용자가 사용할 dispatch함수] =
    useReducer(리듀스함수 : 회계직원, 상태변수초기값);
    */
    const [number, setNumber] = useState(1);

    //비즈니스 로직의 함수를 외부, 파일형태로 관리할 수 있으며, 재사용 가능하다.
    function countReducer(oldCount, action) { // return 을 가져야한다.
        if(action.type === 'UP') {
            return oldCount + action.number;
        }else if(action.type === 'DOWN') {
            return oldCount - action.number;
        }else if(action.type === 'RESET') {
            return 0;
        }
    };

    const [count, countDispatch] = useReducer(countReducer, 0);

    // User가 호출할 함수 ocuntDispatch가 사용되면 = countReducer 호출
    function up() { // 키 : 값
        countDispatch({ type : 'UP', number : number}); // countReducer 함수호출, count -> oldCount
    };

    function down() {
        countDispatch({type : 'DOWN', number : number}); // countReducer 함수호출, count -> oldCount
    };
    
    function reset() {
        countDispatch({type : 'RESET', number : number}); // countReducer 함수호출, count -> oldCount
    };

    function changeNumber(event) {
        setNumber(Number(event.target.value));
    };

    return (
        <div>
            <input type="button" value="-" onClick={down}/>
            <input type="button" value="0" onClick={reset}/>
            <input type="button" value="+" onClick={up}/>
            <input type="text" value={number} onChange={changeNumber} />
            <span>{count}</span>
        </div>
    );
}

export default App_Reducer;