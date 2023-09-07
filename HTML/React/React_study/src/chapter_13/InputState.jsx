import React, {useState} from "react";

// input 태그의 상태 관리하기

function InputState() {

  const [text, setText] = useState (' ');


  // onChange이벤트를 발생한 해당 <input태그를 참조하는 이벤트 객체.
  const onChange = (e) => {
    console.log(e.target.value);
    setText(e.target.value);
  }

  const onReset = () => {
    setText('');
  }

  return (
    <>
      <div>
        <input onChange={onChange} value={text}/>
        <button onClick={onReset}>초기화</button>
        <div>
          <b>값 : </b>
        </div>
      </div>
    </>
  );
} 

export default InputState;