import React, {createContext, useContext} from "react";
import "./style.css"

// 1) 데이터 : 스타일
const themeDefault = {border: `10px solid red`};

// 2)컨텍스트 객체생성 - 데이터
const themeContext = createContext(themeDefault);

/*

Context API 
  - 리액트의 기본 기능 중 하나다.
  - Props를 사용하지 않고, 컴포넌트에 정보공유를 
    직접 제어를 할 수 있는 기능제공.
  - 프로젝트 작업시 전역 상태를 관리할 때 주로 사용된다.

  사용법
  const '건텍스트 객체' = createContext(공유목적의 특정값);
  
  각 함수 컴포넌트에서 사용
  const '변수명' = useContext(변수명);
  


*/


function App_Context() {
  // 3) 컨텍스트 객체의 사용 구문
  const theme = useContext(themeContext);
  return (
    <div className="root" style={theme}>
      <h1>Hello World!</h1>
      <Sub1></Sub1>
    </div>
    
  );
}

function Sub1() {
  return (
    // Sub2하위에서 사용하기 위해, 컴포넌트의 부모인 Sub1에
    // 속성부여를 해야 Sub2 하위 칠드런에게 적용된다.
  <themeContext.Provider value={{border: `1px solid blue`}}>
    <div>
      <h1>Sub1</h1>
      <Sub2 />
    </div>
  </themeContext.Provider>
  );
};
function Sub2() {
  const theme = useContext(themeContext)
  return (
    <div style={theme}>
      <h1>Sub2</h1>
      <Sub3 />
    </div>
  );
};

function Sub3() {
  const theme = useContext(themeContext);
  return (
    <div style={theme}>
      <h1>Sub3</h1>
    </div>
  );
};



export default App_Context;
