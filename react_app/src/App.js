import './App.css';




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
    lis.push(<li key={t.id}>
      <a id={t.id} href={'/read/'+ t.id} onClick={event => {
      event.preventDefault(); // a태그의 href 새로고침 속성제거
      // event : <a>태그를 클릭시  <a>태그를 가리키는 이벤트 객체
      // event.target : a태그 자체를 의미한다.
      // event.target.id : a태그의 id속성값
      props.alerter(event.target.id);
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



function App() {

  const topics = [
    {id:1, title:'html', body: 'html is....'},
    {id:2, title:'css', body: 'css is...'},
    {id:3, title:'javascript', body: 'javascript is...'}
  ];
  
  return (
    <div className="App">
      <Header title="RE4CT" onChangeMode={function() {
        alert('Header');
      }}></Header>
      <Nav topics={topics} alerter={(id) => {
        alert(id);
      }}></Nav>
      <Article title="Welcome" body="Hello.Web!"></Article>
    </div>
  );
}

export default App;
