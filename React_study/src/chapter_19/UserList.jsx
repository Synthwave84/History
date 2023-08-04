import React,{useRef} from "react";

// 배열 데이터를 이용하여, 랜더링하기.
// CRUD - (배열 조회/추가/수정/삭제 기능)

// 리액트 훅중 useRef 사용

// 배열 요소 하나를 출력하는 기능.
function User({user,onRemove, onToggle}) {
    // css 스타일 작업 시 object 문법으로 구성해야한다
    return(
        <div>
            <b style={{
              cursor : 'pointer',
              color : user.active ? 'green' : 'black'
            }}
            onClick={() => onToggle(user.id)}>
              {user.username}
            </b>
            <span>({user.email})</span>
            <button onClick={() => onRemove(user.id)}>삭제</button>
        </div>
    );
}

function UserList({users, onRemove, onToggle}) {

    // 자바스크립트(리액트문법 포함)


    // 배열을 App.js로 이동.
    // 이유? 배열을 CreateUser.jsx에서 사용하고자.

    // 초기값 4의 의미는 현재 users배열의 요소가 id=3 이어서, 추가되는 데이터 키를 의미한다. id=4
    const nextId = useRef(4); 
    // 배열에 데이터추가 함수

    const onCreate = () => {
        nextId.current +=1;
    };
    // 목록에서 클릭시 active필드값을 변경하는 작업.
    
    // 배열에 데이터삭제 함수

    // 배열에 데이터수정 함수



    return (
        <div>
        
            {
            users.map(user => (
                <User user={user} key={user.id} onRemove={onRemove} onToggle={onToggle}/>
            ))
            }

        </div>
    );
}

export default UserList;