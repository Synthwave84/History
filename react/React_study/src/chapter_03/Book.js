import React from "react";

// 함수의 문법을 이용하지만, 리액트에서는 컴포넌트라고 칭한다.
function Book (props) {
  return (
    <div>
      <h1>이 책의 이름은 {props.name} 입니다.</h1>
      <h2>이 책은 총 {props.numOfPage} 페이지로 구성되어 있습니다.</h2>
    </div>
  );
}
 // 타 JS파일에서 import 구문으로 참조가 가능하게 만들어준다
export default Book;