import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
import {BrowserRouter, Route, Routes, NavLink, useParams} from 'react-router-dom';
//  version 5 -> 6 -> Switch -> Routes
// import {HashRouter, Route, Routes, Link} from 'react-router-dom';
// import {HashRouter, Route, Routes, NavLink} from 'react-router-dom';

// useParams: react-router-dom에서 제공하는 Hooks중 하나.
// 파라미터 값을 URL을 통해 넘겨받아 페이지에서 사용 할 수 있도록 한다.\
//  URL 주소의 형태 : 예시 > /topics/1, /topics/2, /topics/3
// ? 뒤에 나온것은 쿼리 스트링이다. 
// 쿼리스트링 : 질이에 사용하는 문자열
// https://newsstand.naver.com/?list&pcode=038
// list&pcode=038 = 쿼리 스트링`
function Home() {
  
    return (
      <div>
        <h2>Home</h2>
        Home....
      </div>
    );
  }
let contents = [
  {id:1, title: 'HTML', description:"HTML Is...."},
  {id:2, title: 'JS', description:"JS Is...."},
  {id:3, title: 'React', description:"React Is...."}
];

function Topic() {
  // 함수 컴포넌트에서 파라미터 정보를 참조하기 위해,휵(Hook) useParams() 함수를 사용해야 한다.
  let params= useParams(); // /topics/1, /topics/2, /topics/3
  // console.log(params);
  // console.log(params.topic_id);
  let topic_id = params.topic_id;
  let selected_topic = {
    title: "Sorry",
    description : "Not Found"
  };
  
  for (let i=0; i<contents.length; i++) {
    // 파라미터 값이 일치하면
    if(contents[i].id === Number(topic_id)) {
      selected_topic = contents[i]; 
      break;
    }
  };
  return(
    <div>
      <h3>{selected_topic.title}</h3>
      {selected_topic.description}
    </div>
  )
}
// Nested Routing -  중첩 라우팅
function Topics() {
  let lis = [];
  for(let i=0; i<contents.length; i++){
    lis.push(
      <li key={contents[i].id}>
        <NavLink to={"/topics/" + contents[i].id}>{contents[i].title}</NavLink>
      </li>
  );
}

  return (
    <div>
      <h2>Topics</h2>
      <ul>
        {/* A태그 대용으로 Link 또는 Navlink를 쓰고, 차이점은 새로고침이 발생하지 않는다.
        Link = class=active 스타일을 제공하지 않고, 
        NavLink는 선택된 항목에 class=active 스타일을 제공한다.
        때문에 NavLink 로 작업 시 css로 속성변경을 쉽게 할 수 있다.
         */}
        {lis}
      </ul>
      <Routes>
        {/* /만 붙이면 URL 자체의 주소가 되고, (:)콜론을 입력하면 값이 된다. */}
        {/* 공통 주소가 /topics/:topic_id */}
        <Route path='/:topic_id' element={<Topic />}/>  
      </Routes>
    </div>
  );
}

function Contract() {
  
  return (
    <div>
      <h2>Contract</h2>
      Contract.....
    </div>
  );
}

function App() {
  return (
    <div>
      <h1>Hello React Router DOM</h1>
      <ul>
        <li><NavLink to='/'>Home</NavLink></li>
        <li><NavLink to='/topics'>Topics</NavLink></li>
        <li><NavLink to='/contract'>Contract</NavLink></li>
      </ul>
      <Routes>
        <Route path = "/" element = {<Home />} />
        <Route path = "/topics/*" element = {<Topics />} />
        <Route path = "/contract" element = {<Contract />} />
        <Route path = "/*" element = {'Not Found'} />
      </Routes>
    </div>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(

  
// BrowserRouter : Router Dom 기능을 적용하기 위하여, Browser Router 태그로 내용을 감싸야한다.

  <React.StrictMode>
    <BrowserRouter>
    {/* <HashRouter> */}
    <App />
    {/* </HashRouter> */}
    </BrowserRouter>
  </React.StrictMode>
);
reportWebVitals();
