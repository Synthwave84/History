import './App.css';
import { useState } from 'react';



// 실제 개발시에는 파일 단위로 생성한다.
// Header.jsx Nav.jsx Article.jsx 식으로 구성한다.

function Header(props) {  // props.title로 인식된다.
  // let props= {title:"WEB", onChangeMode=function {alert();}};
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

  const lis=[]  // [html, css, javascript]
  for(let i=0; i<props.topics.length; i++) {
    let t= props.topics[i];
    lis.push(<li key={t.id}>
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

// 함수형 컴포넌트
function Create(props) {
  return (
    <article>
    <h2>Create</h2>
    <form onSubmit={event => {
      event.preventDefault();  // form태그의 전송(submit)기능을 취소시킨다.
      const title= event.target.title.value;
      const body = event.target.body.value;
      props.onCreate(title, body);
    }}>
      <p><input type="text" name='title' placeholder='title' /></p>
      <p><textarea name='body' placeholder='body '/></p>
      <p><input type="submit" value={"Create"} /></p>
    </form>
  </article>
  );
}

// props.title, props.body, props.onCreate() 함수.
function Update(props) {
  // <p><input type="text" name='title' placeholder='title' value={props.title}/></p>
  // <p><textarea name='body' placeholder='body ' value={props.body}/></p>
  // props.title를 수정폼의 값으로 직접 사용하면, 편집이 되지 않는다. (중요)
  const [title, setTitle] = useState(props.title);
  const [body, setBody] = useState(props.body);



  return (
    <article>
      <h2>Update</h2>
      <form onSubmit={event => {
        event.preventDefault();  // form태그의 전송(submit)기능을 취소시킨다.
        const title= event.target.title.value;
        const body = event.target.body.value;
        props.onUpdate(title, body);
        }}>
          <p><input type="text" name='title' placeholder='title' value={title} 
                  onChange={event=> {
                    setTitle(event.target.value)
                    }}/></p>
          <p><textarea name='body' placeholder='body ' value={body}
                  onChange={event=> {
                    setBody(event.target.value);
                    }}/></p>
          <p><input type="submit" value={"Update"} /></p>
      </form>
    </article>
  );
}


// 일반 변수가 값이 변경된다고 하여, 함수 컴포넌트가 재 실행 되지 아니한다.
// 그런 고로 브라우저의 화면에 렌더링 되지 않는다.
// useStat로 관리되는 변수를 변경 시, 함수 컴포넌트가 재 실행되고, 렌더링된다. 

// 시작 함수 컴포넌트. -Header,Nav,Article
function App() {
  // const mode= 'Welcome';

   // 전체 모드. :Welcome, Read, Create
  const [mode, setMode] = useState("Welcome");
  // 1.html, 2.css, 3.javascript 3개중 하나를 선택했을 때, 구분하는 id 값을 관리하는 useState.
  const [id, setId] = useState(null); // 처음에 보여줄 것이 없으므로 null
  const [nextId, setNextId] = useState(4); // id 값에 해당하는 세부 내용 출력
  const [topics, setTopics] = useState([
    {id: 1, title: 'html', body: 'html is....'},
    {id: 2, title: 'css', body: 'css is...'},
    {id: 3, title: 'javascript', body: 'javascript is...'}
  ]);
  // mode변수가 제어문 사용하기 이전에 전역변수 선언 위치에 해당한다.
  let content = null;
  let contextControl = null;

  // 사용자가 1.html 2.css 3.javascript 목록중 하나를 선택했을 때, topics에서 선택한 id가
  // 일치되는 데이터를 찾아서 세부내용을 클릭하는 작업
  if(mode === 'Welcome') {
    content = <Article title="Welcome" body="Hello.Web!"></Article>
  } else if (mode=== "Read") {
    let title, body = null;

    for(let i=0; i<topics.length; i++) {
      if(topics[i].id === id) { // user가 Nav에서 클릭한 데이터를 출력 하는것
        title = topics[i].title;
        body = topics[i].body;
      }
    }
    content = <Article title={title} body={body}></Article>
    // 모드가 Read 일 때만 활성화 되야 하므로, Read 아래에 삽입하여 Read 모드일 때
    // Update 링크가 나타나게 한다.
    contextControl = <li><a href={'/update' + id} onClick={event=>{
      event.preventDefault();
      setMode('Update');
    }}>Update</a></li>


  }else if (mode==="Create") {
    // 폼 작업
    content = <Create onCreate={(title, body) => {
      const newTopic = {id :nextId, title: title, body: body};
      // topics.push(newTopic);
      // // 추가 데이터
      // setTopics(topics); // 기존 주소를 그대로 사용. 사용 불가.
      const newTopics = [...topics]; // 데이터 복제
      newTopics.push(newTopic);
      setTopics(newTopics); // 주소가 변경된다.
      setMode('Read') // mode 변경
      // 추가된 데이터의 세부 내용을 보여주기 위한 id값 제공
      setId(nextId); 
      setNextId(nextId+1);
    }}>
</Create>
  }  
    else if (mode === "Update") {
    let title, body = null;
    for(let i=0; i<topics.length; i++){
      if(topics[i].id= topics[i].title);
      title= topics[i].title;
      body= topics[i].body;
    }
    content = <Update  title={title} body={body} onUpdate={(title, body) => {

    }}></Update>
  }
    
  return (
    <div className="App">
      {/*  1) <Header /> */}
      <Header title="RE4CT" onChangeMode={function() {
        // mode = "Welcome"; = 읽기전용 변수로 사용해야함
        setMode("Welcome"); // setter함수로 값 변경 목적으로 사용 할 것.
      }}>
      
</Header>


      {/* <Nav /> */}
      <Nav topics={topics} alerter={(id) => {
        // alert(id);
        // mode = "Read"; = 일기전용 변수로 사용해야함
        setMode("Read"); // setter함수로 값 변경 목적으로 사용 할 것.
        setId(id); // 선택한 id 값을 변경함. 
      }}>
    
</Nav>


      {/* 3) <Article /> */}
      {content}

      {/* 4)  속성 생성 버튼 */} 
      <li><a href="/create"  onClick={event => {
      event.preventDefault(); // a태그의 동작을 제거한다. 링크기능 동작이 제거되고, 새로고침이 발생하지않는다.
      setMode("Create"); // App() 함수 컴포넌트가 재 실행 된다.
      }}>Create</a></li>
      {contextControl}
    </div>
  );
}

export default App;
