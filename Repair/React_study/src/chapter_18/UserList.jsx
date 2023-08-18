import React,{useRef} from "react";


// 배열 데이터를 이용하여, 렌더링하기
// CRUD - (배열 조회/추가/수정/삭제 기능)

// 리액트 훅 중 use ref 
//  -useState
// -useRef : 기능 2가지. 1) 특정돔 선택. 2) 작업시 수정, 삭제하는 키값의 역활.

// 배열 요소 하나를 출력하는 기능

function User({ user }) {
  return (
    
    <div>
        <b>{user.username}</b><span>({user.email})</span>
    </div>
  );
}



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
  //  초기값 4의 의미는 현재 users 배열의 마지막요소가 id=3 이어서, 추가되는 데이터 키를 의미한다
  const nextId = useRef(4); 

  // 배열에 데이터 추가 함수
  const onCreate = () => {
    nextId.current += 1;
  }
  // 배열에 데이터 삭제 함수
  // 배열에 데이터 수정 함수


  return (
  
  <>
    {/* JSX와 위에서 사용한 자바스크립트 변수, 함수포함 */}

    {/* 1)작업 */}

    {/* <User user={Users[0]}/> */}
    {/* <User user={Users[1]}/> */}
    {/* <User user={Users[2]}/> */}
    {/* 
    배열을 렌더링할 때에는key 라는 props를 설정해야한다. (중요)
    나중 배열울 추가,수정,삭제시 고유한 키를 통하여, 작업을 하게 되므로
    리액트에서는 배여르이 작업시 고유한 값을 갖는 키작업을 해야한다/ 
    
    배열에 고유한 키값이 존재하지 않으면,  
    {
        Users.map(user, index=> (
          <User user={user} key={index}/>
        ))
    }

    */}

    {/* 2) 작업 */}

      { 
        Users.map(user=> (
          <User user={user} key={user.id}/>
        ))
      }

      {/* 3) 작업 */}
  </>
    
  );
}

export default UserList;