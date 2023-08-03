

import logo from './logo.svg';
import './App.css';

function UserList() {
  // 자바스크립트( 리액트문법 포함)

  // 개별 데이터를 출력하는 함수
    // 배열 선언
    const Users= [
      {
      id:1, 
      username: ' 홍길동 ',
      email: 'user01@abc.com'
    },
    {
      id:2, 
      username: ' 손흥민 ',
      email: 'user02@abc.com'
    },
    {
      id:3, 
      username: ' 이강인 ',
      email: 'user03@abc.com'
    }
  ]; 
}

/*
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}
*/


export default App;
