import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';

import App from './App';
// import Book from './chapter_03/Book'
// import Library from './chapter_03/Library';
// import Clock from './chapter_04/Clock';
// import TestApp from './chapter_04/TestApp';

// import ComponentList from './chapter_05/ComponentList';
// import Employee from './chapter_05/Employee';
// import EmplolyeeList from './chapter_05/EmployeeList';
// import Hello from './chapter_06/Hello';
// import Hello from './chapter_07/Hello';
// import Hello from './chapter_08/Hello.jsx'
// import Hello from './chapter_09/Hello.jsx'
// import Hello from './chapter_10/Hello.jsx'
//import Wrapper from './chapter_09/Wrapper'
// import Hello from './chapter_11/Hello';
//import Counter from './chapter_12/conter';
// import InputState from './chapter_13/inputState';
// import InputState from './chapter_14/InputState'
// import UserList from './chapter_16/UserList';
// import UserList from './chapter_17/UserList'
// import CreateUser from './chapter_18/CreateUser.JSX';
// import UserList from './chapter_18/UserList';
// import UserList from './chapter_19/UserList';
// import CreateUser from './chapter_19/CreateUser';
import reportWebVitals from './reportWebVitals';



const root = ReactDOM.createRoot(document.getElementById('root'));
root.render (
  /*
setInterval(()=>{
  root.render(
    <React.StrictMode>
      <Clook />
    </React.StrictMode>
  //<App />
)}

    {//import Hello from './chapter_5~10/Hello';}
    <Wrapper>
      <Hello name={`홍길동`} age={100} color={`red`} />
      <Hello color={`pink`} />
    </Wrapper>
*/
/* 속성을 이용한 조건부 렌더링 */
    /* <Hello isState={true} /> */
    /*하단처럼 true 또는 false 비 선언시 기본값은 true 다.*/ 
  <React.StrictMode>
      <App></App>
  </React.StrictMode>
)

/*
setInterval(() => {
  root.render(
<React.StrictMode>
    <Clock />
  </React.StrictMode>
  );
}, 1000);
*/



// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
