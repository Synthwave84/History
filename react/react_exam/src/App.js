import { useState } from "react";


function Header(props) {

  return (
    <header>
      <h1>
        <a href='/' onClick={(event) =>{
        event.preventDefault();
      props.onChangeMode();
    }}>
      {props.title}
    </a>
      </h1>
    </header>
  );
}

function Nav(props) {

  const lis=[];
  for(let i=0; i<props.topics.length; i++) {
    let t= props.topics[i];
    lis.push(<li key={t.id}>
      <a id={t.id} href={'/read/' + t.id} onClick={event =>{
        event.preventDefault();
        props.onChange (Number(event.target.id));
      }}>
        {t.title}
      </a>
    </li>);
  }
  return (
    <nav>
      <ol>
        {lis}
      </ol>
    </nav>
  )
}

function Article (props) {

  return (
    <article>
      <h2>
        {props.title}
      </h2>
        {props.body}
    </article>
  );
}

function Create(props) {
  return (
    <article>
      <h2>Create</h2>
      <form onSubmit={event => {
        event.preventDefault();
        const title = event.target.title.value;
        const body = event.target.body.value;
        props.onCreate(title. body);
      }}>
      <p><input type='text' name='title' placeholder="title"/></p>
      <p><textarea name="body" placeholder="body"/></p>
      <p><input type="submit" value={"Create"}/></p>
      </form>
    </article>
  )
}

function Update(props) {

  const[title, setTitle] = useState(props.title);
  const [body, setBody] = useState(props.body);

  return (
    <article>
      <h2>Update</h2>
      <form onSubmit={event => {
        event.preventDefault();
        const title= event.target.title.value;
        const body= event.target.body.value;
        props.onUpdate(title, body);
      }}>
        <p><input type="text" name="title" placeholder="title" value={title}
        onChange={event => {
          setTitle(event.target.value);
        }}/>
        </p>
        <p>
          <textarea name="body" placeholder="body" value={body}
          onChange={event => {
            setBody(event.target.value);
          }}/>
        </p>
        <p>
          <input type="submit" value={"Update"} />
        </p>
      </form>
    </article>
  );
}

function App () {

  const [mode, setMode] = useState("Welcome");
  const [id, setId] = useState(null);
  const [nextId, setNextId] = useState(4);
  const [topics, setTopics] = useState([
    {id: 1, title:'html', body: 'html is...'},
    {id: 2, title: 'css', body: 'css is...'},
    {id: 3, title: 'javascript', body: 'javascript is....'}
  ]);

  let content = null;
  let contextControl = null;

  if(mode === 'Welcome') {
    content = <Article title='Welcome' body='Hello.Web!'></Article>
  }else if (mode=== 'Read') {
    let title, body = null;
  
  for(let i=0; i<topics.length; i++) {
    if(topics[i].id === id) {
      title = topics[i].title;
      body =topics[i].body;
    }
  };
  content =<Article title={title} body={body}></Article> 

  contextControl = 
  <>
  <li>
    <a href={'/update' + id} onClick={event=>{
      event.preventDefault();
      setMode('Update');
    }}>Update</a>
 
    <br /><input type="button" value='Delete' onClick={() =>{
      if(!window.confirm('삭제 하시겠습니까?')) return;
      const newTopics =[];
      for(let i=0; i<topics.length; i++) {
        if(topics[i].id !== id){
          newTopics.push(topics[i]);
        }
      }
      setTopics(newTopics);
      setMode("Welcome");
    }}/>
    </li>
    </>

}else if (mode === "Create") {
  content = <Create onCreate={(title, body) =>{
    const newTopic= {id: nextId, title: title, body: body};
    const newTopics = [...topics];
    newTopics.push(newTopic);
    setTopics(newTopics);
    setMode("Read")
    setId(nextId);
    setNextId(nextId+1);

  }}></Create>
}
else if(mode === "Update") {
  let title, body = null;
  for(let i=0; i<topics.length; i++) {
    if(topics[i].id === id){
      title = topics[i].title;
      body = topics[i].body;
      break;
    }
  }
  content = <Update  title={title} body={body} onUpdate={(title, body) => {
  
    const newTopics=[...topics];
    const updatedTopic = {id:id, title:title, body:body};

    for(let i=0; i<newTopics.length; i++) {
      if(topics[i].id === id) {
        newTopics[i] = updatedTopic;
        break;
      }
    }
    setTopics(newTopics);
    setMode("Read");
  }}></Update>
}
return (
  <div className="App">
    
    <Header title="WEB" onChangeMode={function() {
     
      setMode("Welcome"); 
    }}>
    </Header>



    <Nav topics={topics} onChange={(id) => {
     
      setMode("Read"); // setter함수로 값 변경 목적으로 사용 할 것.
      setId(id);
    }}>
    </Nav>


    {content}

     
    <li><a href="/create"  onClick={event => {
    event.preventDefault(); 
    setMode("Create"); 
    }}>Create</a></li>
    {contextControl}
  </div>
);
}



export default App;
