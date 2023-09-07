// create 클릭 시 동작되는 컴포넌ㅌ,, 수정모드로 출력하는 작업,
'use client'
// import { useRouter } from "next/router"; // 버전 12짜리
import {useRouter} from "next/navigation"; // 버전 13짜리
 // 이 구문을 사용하면, client component에서 지원하는 문법을 사용 할 수 있다.

export default function Create() {
const router = useRouter()
  
  return (
    <>
      <form onSubmit={async e => {
        e.preventDefault();
        const title = e.target.title.value;
        const body = e.target.body.value;
        const options = {
          method: 'POST',
          headers : {
            'Content-Type' :'application/json'
          },
          body: JSON.stringify({title, body}) // {title :title, body : body}
        };
        const resp = await fetch(`${process.env.NEXT_PUBLIC_API_URL}topics`, options)
        const topic = await resp.json(); // 새글 등록시 (create) 작업결과.
        // 클라이언트 컴포넌트로 기능이 동작하니, 개발자 도구 콘솔에서 확인
        console.log("topic", topic);
        router.push(`/read/${topic.id}`);
        // 서버 컴포넌트를 서버쪽에서 다시 재 랜더링해서 새로고침 하는 기능
        router.refresh(); 
      }}>
        <h2>Create</h2>
        <p><input type="text" name="title" placeholder="title"></input></p>
        <p><textarea name="body" placeholder="body"></textarea></p>
        <p><input type="submit" value="create"></input></p>
      </form>
      
    </>
  );
}