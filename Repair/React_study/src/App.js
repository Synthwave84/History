import React, {useRef,useState} from 'react';
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

  // UserList 함수형 컴포넌트에 존재하고 있던 배열을부모 함수형 컴포넌트 
  // App.js로 이동 시켰다.
  // 데이터. 개발에서 DB의 내용이 불러와서 사용한다.

  // const inputs = {username : '', email: ''};
  // setInputs 함수 : inputs의 객체의 값을 변경하는 목적
  const [inputs,setInputs] = useState({
    username : '',
    email : ''
  });


  // 비구조화 할당
  // const username = inputs.username;
  // const email = inputs.email;

  // 1)프로젝트 실행 시, App.js 함수형 컴포넌트가 처음 실행되고,
  // 2) 아이디 값 입력 시, useState 정보가 변경되어 App.js 함수형 컴포넌트가 두번째 실행 되고,
  // 3) 이메일 값 입력 시, useState 정보가 변경되어 App.js 함수형 컴포넌트가 세번째 실행 된다,
  // 결과적으로 아래 구문에 username, email 변수에 입력한 값을 참조 사용하게 된다.
  
  // App.js 함수 컴포넌트가 실행될 때 마다, useState 변수인 inputs 를 통하여,
  // 사용자가 입력한 값을 각각 username, email 상수에 값을 읽어야한다.
  const {username, email} = inputs; // useState변수

  // 아이디와 이메일 input 텍스트박스 onChange 이벤트가 발생 할 때 
  // 호출 될 함수.
  // 당연하지만 함수 명은 아무거나 사용해도 상관 없다. 다만, onChange 이벤트를 발생시키기 위해
  // 사용하는 함수이므로, 이름을 동일시 하여 혼돈을 방지하기 위해 동일한 이름을 채용한다.
  const onChange = e => {

    // e. targe의 속 내용
    // <input name="username" placeholder="아이디" value={username} onChange={onChange}/>
    // <input name="email" placeholder="이메일" value={email} onChange={onChange} />
    // 사용자가 입력한 태그의 이름과 값을 읽어오는 구문
    const {name, value } = e.target;
    
    // useState 변경 : 함수 컴포넌트(App()) 재 실행.

    // 아이디와 이메일에 각각 데이터를 입력하면, onChange이벤트가 발생되어
    // useState()에 입력한 값을 변경시킨다.
    // App() 함수 컴포넌트가 재 실행된다 ( 중요)
  
    setInputs({
      ...inputs, // 스프레드 연산자. 복제하는 기능을 가진다
      // 대괄호를 지정하는 이유는 name을 변수로 지정하기 위함이다.
      // 만약에 대괄호를 빼버리면 변수가 아니라 그냥 문자로 해석이 되어버린다.
      [name] : value

    /* setInputs(
        {username: '', email:''}, username : '입력값'  <- 원래의 username 을 덮어쓰고 바깥에 있는 것이 
        // 그 자리를 차지하게 된다.
        
        1) 첫 상태 setInputs({username : '', email: '', [name]: value});
        2) 아이디 텍스트박스 값을 입력시 onChange이벤트 발생
            setInputs({username: '', email: '', username: '입력값'});
            -> setInputs({username: '입력값', email: '',});
        3) 이메일 텍스트박스 값을 입력시 onChange이벤트가 발생되면
            setInputs({username : '입력값', email : '', email : '입력값'});
            -> setInputs({username : '입력값', email : '입력값',});

        첫 상태 - setInputs({username : '', email: '',});
        최종 -  setInputs({username: '입력값', email : '입력값' });
        
      );
    */ 

    });
  };





  // 배열 데이터를 useState()훅에서 관리를 해야한다.
  // 이유는 배열에 데이터를 추가하여도, App()컴포넌트가 웹 특성상 재 실행 되지 않아서
  // UserList 함수 컴포넌트의 내용이 갱신되지 않기에, 이전상태로 보이게 된다.

  const [users, setUsers] = useState(
    [
      {
        id:1,
        username: '홍길동',
        email: 'user01@abc.com',
        active : true
      },
      {
        id:2,
        username: '손흥민',
        email: 'user02@abc.com',
        active : false
      },
      {
        id:3,
        username: '이강인',
        email: 'user03@abc.com',
        active : false
      }
    ]);
  

  const nextId = useRef(4); // 추가되는 배열 데이터의 id를 4로 사용한다.

  // 이후 추가 버튼 클릭시 동작 할 이벤트 함수.
  const onCreate = () => {

    // 배열에 항목 추가 로직,
    // 신규 추가 데이터를 object구문으로 생성한다.

    const user = {
    id: nextId.current,
    username,
    email
    };

    // useState함수로 배열의 값을 변경. 
    // useState가 관리하는 데이터가 배열이므로, 배열은 객체이다.
    // 그래서 useState는 객체의 주소가 변경이 되어야만 하기때문에, 새로운 배열로 구성을 하게된다.
    setUsers([...users, user]); // 배열에 object으로 데이터가 추가됨. App.js 함수 컴포넌트가
                                           // 재 실행된다

    setInputs({
      username: '', 
      email: '' 
    });
    nextId.current += 1;
  }
  
  // 삭제버튼을 클릭 시 호출할 이벤트 함수.
  const onRemove = id => {
    // 배열데이터에서 배열 데이터 하나를 삭제 하는 의미.
    // 삭제하려는 id를 매개변수로 받는다.
    // filter() 메소드 : 배열에서 id가 같지 않은 것만 선택하는 기능.
    setUsers(users.filter(user=> user.id !== id)) // App.js 함수 컴포넌트가 다시 한번 재 실행된다.
  }
  const onToggle = id=> {
    setUsers(
      users.map(user => 
        // ? = true 이면 중괄호를 실행하고, 그렇지 않으면 : 뒤에 있는 구문을 실행한다
        user.id === id ? {...user, active: !user.active} : user) 
    );
  };
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
      <CreateUser username={username} email={email} onChange={onChange} onCreate={onCreate}/>
      <UserList users={users} onRemove={onRemove} onToggle={onToggle}/>
    </>
  );
}
export default App;