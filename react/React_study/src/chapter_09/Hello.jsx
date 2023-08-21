import React from "react";

// 비구조화 할당(구조분해) 문법 사용.
// object 문법에서 {color : color} key,value동일하면, { color }로 표기가 가능하다
function Hello({name, age, color}) {
  return ( 
    <div>
      {/* 리액트에서는 style구문 사용시 object구문으로 사용해야한다 (중요!!!!!) */}
      <div>이름은 ? {name}</div>
      <div style={{color}}>나이는? {age}</div>
    </div>
  );
}
// 속성 : 기본값

Hello.defaultProps = {
  name : "이름없음",
  age : "50"
};

export default Hello;