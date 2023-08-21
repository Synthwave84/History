import React from "react";

function Wrapper({children}) {
  // jsx구문에 style 적용시 object 문법을 사용해야한다.
  const style = {
    border : "2px solid black" ,
    padding : "16px"

  }
  return (
    <div style={style}>
      {children}
    </div>
  )
};

export default Wrapper;