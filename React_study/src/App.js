import React, {useRef} from 'react';
import UserList from "./chapter_19/UserList.jsx"
import CreateUser from "./chapter_19/CreateUser.jsx"

import './App.css';
// import Hello from './chapter_05/Hello';
function App() {
  //자바스크립트 구문작업
  //const name = "홍길동";
      // 배열선언 - 요소에 사용하는 데이터는 object사용.

  // style 작업은 object구문으로 해야 함.
  //const style = {
  //  backgroundColor : 'black',
  //  color : 'aqua',
  //  fontSize : 24, // 기본단위 px
  //  padding: '1rem' //
  //}
  // App.css파일의 선택자를 사용시 class속성 사용하지말고, className으로 사용 권장
  
  // 배열선언 - 요소에 사용하는 데이터는 object사용.
  const users = [
    {
      id:1,
      username: '홍길동',
      email: 'user01@abc.com'
    },
    {
      id:2,
      username: '손흥민',
      email: 'user02@abc.com'
    },
    {
      id:3,
      username: '이강인',
      email: 'user03@abc.com'
    }
  ];

  const nextId = useRef(4);
  const OnCreate = () => {

  }
  
  return(
    <>
      {/* 자바스크립트 주석효과 */}
      {/*
      <Hello />
      <Hello 
      // 주석효과 
      />
      
      <Hello />
      <div style={style}>{name}</div>
      <div className="gray-box"></div>
      */}
      <CreateUser />
      <UserList users={users}/>
    </>
  );
}
export default App;