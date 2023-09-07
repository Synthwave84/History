import React from "react";


function UserList() {
  // 자바스크립트( 리액트문법 포함)

    // 배열 선언
    const Users= [
      {
      id:1, 
      username: ' 홍길동 ',
      email: 'user01@abc.com'
    },
    {
      id:1, 
      username: ' 손흥민 ',
      email: 'user02@abc.com'
    },
    {
      id:1, 
      username: ' 이강인 ',
      email: 'user03@abc.com'
    }
  ]; 



  return (
  
  <>
    <div>
    {/* JSX와 위에서 사용한 자바스크립트 변수, 함수포함 */}

      <div>
        <b>{Users[0].username}</b><span>({Users[0].email})</span>
      </div>
      <div>
        <b>{Users[1].username}</b><span>({Users[1].email})</span>
      </div>
      <div>
        <b>{Users[2].username}</b><span>({Users[2].email})</span>
      </div>
    </div>
  </>
    
  );
}

export default UserList;