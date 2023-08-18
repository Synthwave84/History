import React from "react";


function Hello(props) {
  return ( 
    <div>
      {/* 리액트에서는 style구문 사용시 object구문으로 사용해야한다 (중요!!!!!) */}
      <div>이름은 ? {props.name}</div>
      <div style={{color:props.color}}>나이는? {props.age}</div>
    </div>
  );
}

export default Hello;