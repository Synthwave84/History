// server component에서는 on이벤트,  리액트 훅을 지원하지 않는다.
// 이 파일에서 onSubmit()작업을 이용하므로, 기본은 서버컴포넌트이므로,
// 클라이언트 컴포넌트로 변경해 주어야한다.
'use client'
import { useRouter } from "next/navigation";
import { useState, useEffect} from "react";

// 화면(UI)수정폼을 출력작업

export default function Update(props) {
    // 1)  자바스크립트 : 수정폼에 사용될 수정내용을 가져오는 작업.
    // 2) return jsx구문 : 폼태그에 수정내용을 담아 화면에 뿌려주는 기능 (렌더링)

    // 수정폼 작업시 1) useState 
    // 2) <input type="text" name="title" placeholder="title"  
    // onChange= {e=>setTitle(e.target.value)} value={title}></input>
    // useState + onChange + value 작업을 해야한다.
    const router = useRouter();  // 라우팅 기능을 지원. ( 주소를 요청하는 작업이다.)

    // 상태관리, 수정폼에 내용을 유지하기 위하여,
    const [title, setTitle] = useState('');
    const [body, setBody] = useState('');
    const id = props.params.id;

    async function refresh() {
    const resp = await fetch(`${process.env.NEXT_PUBLIC_API_URL}topics/${id}`);
    const topic = await resp.json(); // id에 해당하는 수정내용
      setTitle(topic.title);
      setBody(topic.body);
  }

    // Update 컴포넌트가 처음 렌더링 될 때, 단 한번만 실행
    // 리액트 Hook
    useEffect( ()=> {
      refresh();
    }, []); // [] 빈배열

  
      return (
        <form onSubmit={async e=> {
          // 새로고침 현상을 제거하고, 수정된 내용을 요청하는 작업.
          e.preventDefault();
          // 수정된 내용 e.target : <form> 태그
          const title = e.target.title.value;
          const body = e.target.body.value;
          const options = {
            // 수정을 할 때 사용하는 method 이다. 
            method: 'PATCH', // PUT
            headers : {
              // MIME 보내는 데이터가 어떠한 타입인지 알려주는것
              'Content-Type' : 'application/json'
            },
            body: JSON.stringify({title, body}) // {title :title, body : body}
          };

          const resp = await fetch(`${process.env.NEXT_PUBLIC_API_URL}topics/${id}`,options);
          const topic = await resp.json()
          router.push(`/read/${topic.id}`);
          router.refresh();
        }}>
          <h2>Update</h2>
          <p><input type="text" name="title" placeholder="title"  
          onChange= {e=>setTitle(e.target.value)} value={title}></input></p>
          <p><textarea name="body" placeholder="body" 
          onChange= {e=>setBody(e.target.value)} value={body}></textarea></p>
          <p><input type="submit" value="update"></input></p>
        </form>
      );
}