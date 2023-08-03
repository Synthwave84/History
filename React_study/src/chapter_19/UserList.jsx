import React,{useRef} from "react";

// 배열 데이터를 이용하여, 랜더링하기.
// CRUD - (배열 조회/추가/수정/삭제 기능)

// 리액트 훅중 useRef 사용

// 배열 요소 하나를 출력하는 기능.
function User({user}) {
    
    return(
        <div>
            <b>{user.username}</b><span>({user.email})</span>
        </div>
    )
}

function UserList({users}) {

    // 자바스크립트(리액트문법 포함)


    // 배열을 App.js로 이동.
    // 이유? 배열을 CreateUser.jsx에서 사용하고자.

    // 초기값 4의 의미는 현재 users배열의 요소가 id=3 이어서, 추가되는 데이터 키를 의미한다. id=4
    const nextId = useRef(4); 
    // 배열에 데이터추가 함수

    const onCreate = () => {
        nextId.current +=1;
    }

    // 배열에 데이터삭제 함수

    // 배열에 데이터수정 함수



    return (
        <div>
        {/*JSX와 위에서 사용한 자바스크립트 변수,함수포함 */}
        {/* 1)작업
        <User user={users[0]}/>
        <User user={users[1]}/>
        <User user={users[2]}/>
        */}
        {/* 
        배열을 랜더링할 때에는 key 라는 props를 설정해야 한다.(중요) 
        나중 배열을 추가,수정,삭제시 고유한 키를 통하여, 작업을 하게되므로
        리액트에서는 배열작업시 고유한 값을 갖는 키작업을 해야한다.

        배열에 고유 키값이 존재하지 않으면
            users.map(user,index) => (
                <User user={user} key={user.index}/>
            ))
        */}
            {
            users.map(user => (
                <User user={user} key={user.id}/>
            ))
            }

        </div>
    );
}

export default UserList;