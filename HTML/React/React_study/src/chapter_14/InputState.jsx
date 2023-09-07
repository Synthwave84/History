import React, {useState} from "react";

// 여러개의 input 태그의 상태 관리하기

function InputState() {

  // 초기값을 오브젝트로 선언했다.

  /* 
    const name= input.name;
    const nickname = input.nickname;
  */
  // 상단의 코드와 동일하다.

  // const Inputs = {name : '' , nickname : ''}
  const [inputs, setInputs] = useState({
    name : '',
    nickname : ''
  });

// 비구조화 할당(구조분해)
const {name, nickname} = inputs; // inputs.name , inputs.nickname

  // onChange이벤트를 발생한 해당 <input태그를 참조하는 이벤트 객체.
  // 이벤트 e 객체는 이름이  onChange일 경우에는 <input name="name"> 를 참조하는 객체
  // 이벤트 e 객체는 닉네임이  onChange일 경우에는 <input name="ickname"> 를 참조하는 객체
  const onChange = (e) => {

    /* 
    const value = e.target.value;
    const name = e.target.name;
    */
    const {name, value} = e.target;
    console.log("value", value); // 사용자의 입력값
    console.log("name", name); // <input name "name">

    // useState 변수 값을 변경.
    // object 구조로 사용해야한다. 왜냐면 상단이 object 문법으로 구성되어있기 때문이다.
    // {name : '', nickname : '' , name: ''}
    // 새로운 object생성(내용은 기존 것을 복사, name : value  변경한 키값 작업.)
    // inputs.name = value; : ( 에러!!!! ) 직접 변경해서는 안된다.
    // 이름 텍스트박스setInputs ({{name :'' , nickname: ''}), name : value}) ;
    // 이름 텍스트박스setInputs ({{name :'' , nickname: ''}), nickname : value}) ;
    setInputs({...inputs, [name] : value }); // 새로운 객체의 주소가 변경된다.
  }

  const onReset = () => {
  setInputs({
    name : '',
    nickname : ''
  });
  }
  const[a,b] = useState(0)
  const check = () => {
    b(a+1);
  }

  return (
    <>
      <div>
        <input name="name" placeholder="이름"  onChange={onChange} value={name}/>
        <input name="nickname" placeholder="닉네임"  onChange={onChange} value={nickname}/>
        <button onClick={onReset}>초기화</button>
        <button onClick={check}>작업1</button>
        <div>
          <b>값 : </b>
          {name} ({nickname})
        </div>
      </div>
    </>
  );
} 

export default InputState;