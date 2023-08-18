import React from "react";



function CreateUser ({username, email, onChange, onCreate}) {
  return (
    <div>
      <input name="username" placeholder="아이디"  value={username} onChange={onChange}/>
      <input name="email" placeholder="이메일"  value={email} onChange={onChange}/>
      <button onClick={onCreate}>추가</button>
    </div>
  );
}

export default CreateUser;