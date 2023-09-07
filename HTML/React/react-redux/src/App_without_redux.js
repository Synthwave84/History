import React, {useState} from 'react'
import "./style.css"


// redux 미사용 예제
// props를 이용한 계층
function App() {
  const [number, setNumber] = useState(1);
  return (

    <div id="container">
      <h1>Root : {number}</h1>
      <div id="grid">
      <Left1 number={number}></Left1>
      <Right1  onIncrease= {() => {
        setNumber(number +1);
      }}></Right1>
      </div>
    </div>
  );
}

// let porps = (number : number); props.number;
function Left1(props) {
  return (
    <div>
      <h1>Left1 : {props.number}</h1>
      <Left2 number={props.number}></Left2>
    </div>
  );
}

function Left2(props) {
  return (
    <div>
      <h1>Left2 : {props.number} </h1>
      <Left3 number={props.number}></Left3>
    </div>
  );
}


function Left3(props) {
  return (
    <div>
      <h1>Left3 : {props.number}</h1>
    </div>
  );
}

function Right1(props) {
  return (
    <div>
    <h1>Right1 : </h1>
    <Right2 onIncrease={() => {
props.onIncrease()
}}></Right2>
    </div>
  );

}
function Right2(props) {
  return (
    <div>
    <h1>Right2 : </h1>
    <Right3 onIncrease={() => {
props.onIncrease()
}}></Right3>
    </div>
  );

}
function Right3(props) {
  return (
    <div>
    <h1>Right3 : </h1>
    <input type='button' value="증가" onClick={() => {
      props.onIncrease();  
    }} /> 
    </div>
  );

}



export default App;
