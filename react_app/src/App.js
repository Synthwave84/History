import './App.css';
import { useState } from 'react';



// 실제 개발시에는 파일 단위로 생성한다.
// Header.jsx Nav.jsx Article.jsx 식으로 구성한다.

function Header(props) {  // props.title로 인식된다.
  // let props= {title:"WEB", onChangeMode=function {alert();}};
  console.log(props.title)
  return (
    <header>
    <h1><a href='/' onClick={(event) => {
      event.preventDefault(); // a태그의 클릭 시 진행되는 기본동작 성격을 취소하는 작업. 
      props.onChangeMode();
      }}>{props.title}</a></h1>
  </header>
  );
}

// 함수형 컴포넌트
function Nav(props) {
  console.log(props.topics)

  const lis=[]  // [html, css, javascript]
  for(let i=0; i<props.topics.length; i++) {
    let t= props.topics[i];
    lis.push(<li key={t.id}>;
      <a id={t.id} href={'/read/'+ t.id} onClick={event => {
      event.preventDefault(); // a태그의 href 새로고침 속성제거
      // event : <a>태그를 클릭시  <a>태그를 가리키는 이벤트 객체
      // event.target : a태그 자체를 의미한다.
      // event.target.id : a태그의 id속성값
    props.alerter (Number(event.target.id)); 
    // 태그의 내용일시 속성값은 string 이다. 때문에 Number() 형번환작업을 해준다
    }}>
    {t.title}</a></li>);
  }
  return (
    <nav>
    <ol>
      {lis}
    </ol>
  </nav>
  );
}

function Article (props) {
  
  return (
    <article>
    <h2>{props.title}</h2>
    {props.body}
    
  </article>
  );
}


// 일반 변수가 값이 변경된다고 하여, 함수 컴포넌트가 재 실행 되지 아니한다.
// 그런 고로 브라우저의 화면에 렌더링 되지 않는다.
// useStat로 관리되는 변수를 변경 시, 함수 컴포넌트가 재 실행되고, 렌더링된다. 
function App() {
  // const mode= 'Welcome';

  const [mode, setMode] = useState("Welcome");
  const [id, setId] = useState(null);
  const topics = [
    {id:1, title:'html', body: 'html is....'},
    {id:2, title:'css', body: 'css is...'},
    {id:3, title:'javascript', body: 'javascript is...'}
  ];
  let content = null;
  if(mode === 'Welcome') {
    content = <Article title="Welcome" body="Hello.Web!"></Article>
  } else if (mode=== "Read") {
    let title, body = null;
    for(let i=0; i<topics.length; i++) {
      console.log("확인", typeof topics[i].id,  typeof id);
      if(topics[i].id === id) { // user가 Nav에서 클릭한 데이터를 출력 하는것
        title = topics[i].title;
        body = topics[i].body;
      }
    }
    content = <Article title={title} body={body}></Article>
  }

  return (
    <div className="App">
      <Header title="RE4CT" onChangeMode={function() {
        // mode = "Welcome"; = 읽기전용 변수로 사용해야함
        setMode("Welcome"); // setter함수로 값 변경 목적으로 사용 할 것.
      }}></Header>
      <Nav topics={topics} alerter={(id) => {
        // alert(id);
        // mode = "Read"; = 일기전용 변수로 사용해야함
        setMode("Read"); // setter함수로 값 변경 목적으로 사용 할 것.
        setId(id);
      }}></Nav>
      {content}
    </div>
  );
}

export default App;
