import React from "react";
import Employee from "./Employee";

function EmployeeList() {
  return (
    <div>
      <Employee e_num={1} e_name="홍길동" />
      <Employee e_num={2} e_name="김정웅" />
      <Employee e_num={3} e_name="제임스" />
    </div>
  );
}

export default EmployeeList;