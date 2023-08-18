import React from "react";

// 속성을 이용한 조건부 렌더링
function Hello({color, name, isState}) {
  return (
    <div style={{color:color}}>
      {
        // True 일떄는 영어. False 일떄는 한국어로 표기한다.
      isState ? 'Hello World React!!!' : '안녕하세요 리액트 입니다!' 
      }
    </div>
  );
}

export default Hello;