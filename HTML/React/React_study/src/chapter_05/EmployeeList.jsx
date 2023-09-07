import React from "react";
import Employee from "./Employee";

function EmployeeList() {
  return (
    // jsx 프래그먼트
    <>
      <Employee e_num={1} e_name="홍길동" />
      <Employee e_num={2} e_name="김정웅" />
      <Employee e_num={3} e_name="제임스" />
    </>
  );
}

export default EmployeeList;