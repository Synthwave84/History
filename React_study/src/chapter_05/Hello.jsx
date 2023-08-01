import React from "react";
import './gray-box.css'
// 자바스크립트 구문 작업
const name = "홍길동";

// Style 작업은 object구문으로 해야 함

const style = {
  backgroundColor : "aquamarine", 
  color : "blue",
  fontsize : "24px",
  padding  : "1rem"  // 
  // 기본단위 px
}

function Hello() {
  return (
    <>
      Hello React!
      <div style={style}>{name}</div> 
      <div className="gray-box"></div> 
      
      {/* Hello.css  파일의 선택자를 사용시 class속성 대신 className을 사용한다.*/}
    </>
  );
}
export default Hello;