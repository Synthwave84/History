import React, {useRef,useState} from 'react';
import UserList from "./chapter_19/UserList.jsx"
import CreateUser from "./chapter_19/CreateUser.jsx"

import './App.css';
function App() {
  
  const [inputs,setInputs] = useState({
    username : '',
    email : ''
  });
  const {username, email} = inputs;
  const onChange = e => {
  const {name, value } = e.target;
    
  setInputs({
      ...inputs,  [name] : value
    });
  };


  const [users, setUsers] = useState(
    [
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
    ]);
  
  const nextId = useRef(4);


  const onCreate = () => {

    const user = {
    id: nextId.current,
    username,
    email
    };
    setUsers([...users, user]); 

    setInputs({
      username: '', 
      email: '' 
    });
    nextId.current += 1;
  }
  
  return(
    <>
      <CreateUser username={username} email={email} onChange={onChange} onCreate={onCreate}/>
      <UserList users={users}/>
    </>
  );
}
export default App;