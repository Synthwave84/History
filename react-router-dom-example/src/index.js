import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
import {BrowserRouter, Route, Routes, NavLink} from 'react-router-dom';
// import {HashRouter, Route, Routes, Link} from 'react-router-dom';
// import {HashRouter, Route, Routes, NavLink} from 'react-router-dom';
function Home() {
  
  return (
    <div>
      <h2>Home</h2>
      Home....
    </div>
  );
}

// Nested Routing -  중첩 라우팅
function Topics() {

  return (
    <div>
      <h2>Topics</h2>
      <ul>
        <li><NavLink to="/topics/1">HTML</NavLink></li>
        <li><NavLink to="/topics/2">JS</NavLink></li>
        <li><NavLink to="/topics/3">React</NavLink></li>
      </ul>
      <Routes>
        <Route path='/1' element={'HTML is ...'} />
        <Route path='/2' element={'JS is ...'} />
        <Route path='/3' element={'React is ...'} />
        <Route path='/*' element={'Not Found'} />
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
  <React.StrictMode>
    <BrowserRouter>
    {/* <HashRouter> */}
    <App />
    {/* </HashRouter> */}
    </BrowserRouter>
  </React.StrictMode>
);
// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
