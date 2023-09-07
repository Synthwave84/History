import React from "react";
import { styled } from "styled-components";

/*
styled-components
리액트에서는 스타일을 자바스크립트 object로 작업하지만,
styled-components 패키지는 기존 css 명령어를 그대로 사용할 수 있다.
*/

// 함수컴포넌트와 같은 의미로 본다.
const SimpleButton = styled.button`
  color: white;
  background-color : green;
`;
/*
상속 문법
styled(부모 컴포넌트)

부모 컴포넌트의 종류, 
1) 스타일드 함수 컴포넌트. 
2) 일반 함수 컴포넌트.

*/ 
// SimpleButton을 상속받아 css 확장 작업 가능.
const LargeButton = styled(SimpleButton)`
  font-size : 50px;

`;

// 속성(props) 이용.
const ReactButton = (props) => {
  console.log('props', props)
  return <button className={props.className}>{props.children}</button>
};

// ReactButton 일반함수 컴포넌트를 상속받아 css확장 작업이 가능하다.
const ReactLargeButton = styled(ReactButton)`
font-size: 50px;
`;

const PrimaryButton = styled.button`
  color : ${(props) => (props.primary ? 'red' : 'green')};
  background-color : ${(props) => (props.primary ? 'blue':'red')}
`;

function App() {
  return (
    <div className="App">
      <SimpleButton>Simple</SimpleButton>
      <LargeButton>Large</LargeButton>
      <br /><br />
      <ReactButton>React</ReactButton>
      <ReactLargeButton>React Large</ReactLargeButton>
      <br /><br />
      <PrimaryButton>Normal</PrimaryButton>
      <PrimaryButton primary>Primary</PrimaryButton>
    </div>
  );
}

export default App;