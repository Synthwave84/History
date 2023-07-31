import React, { useState } from "react";

function Toggle({ toggle, setToggle }) {
  return (
    <button 
      style={{ backgroundColor: toggle ? "#fff" : "#f0f", color: toggle ? "#000" : "#fff" }}
      onClick={() => setToggle(!toggle)}
    >
      버튼
    </button>
  )
}

function TestApp() {
  const [toggle, setToggle] = useState(false);

  return (
    <div>
      <Toggle toggle={toggle} setToggle={setToggle} />
      {
        toggle && (
          <div>리액트의 상태관리</div>
        )
      }
    </div>
  );
}

export default TestApp;