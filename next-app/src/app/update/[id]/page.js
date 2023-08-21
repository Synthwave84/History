// server component에서는 on이벤트,  리액트 훅을 지원하지 않는다.
// 이 파일에서 onSubmit()작업을 이용하므로, 기본은 서버컴포넌트이므로,
// 클라이언트 컴포넌트로 변경해 주어야한다.
'use client'
import { useRouter } from "next/navigation";
import { useEffect, useState} from "react";

// 화면(UI)수정폼을 출력작업
export default function Update(props) {
    const router = useRouter();
    const [title, setTitle] = useState('');
    const [body, setBody] = useState('');
    const id = props.params.id;

    async function refresh() {
    const resp = await fetch(`http://localhost:9999/topics/${id}`);
    const topic = await resp.json(); // id에 해당하는 수정내용
      setTitle(topic.title);
      setBody(topic.body);
  }

    // Update 컴포넌트가 처음 렌더링 될 때, 단 한번만 실행
    useEffect( ()=> {
      refresh();
    }, []);

  
      return (
        <form onSubmit={async e=> {
          e.preventDefault();
          const title = e.target.title.value;
          const body = e.target.body.value;
          const options = {
            method: 'PATCH', // PUT
            headers : {
              'Content-Type' :'application/json'
            },
            body: JSON.stringify({title, body}) // {title :title, body : body}
          };

          const resp = await fetch(`http://localhost:9999/topics/${id}`,options);
          const topic = await resp.json()
          router.push(`/read/${topic.id}`);
          router.refresh();
        }}>
          <h2>Update</h2>
          <p><input type="text" name="title" placeholder="title"  
          onChage= {e=>setTitle(e.target.value)} value={title}></input></p>
          <p><textarea name="body" placeholder="body" 
          onChage= {e=>setBody(e.target.value)} value={body}></textarea></p>
          <p><input type="submit" value="update"></input></p>
        </form>
      );
}