import React from "react";

function Employee(props) {
  return (
    <div>
      <h1>사원번호 : {props.e_num}</h1>
      <h2>사원이름 : {props.e_name}</h2>
    </div>
  );
}

export default Employee;
