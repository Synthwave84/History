// layout.js 파일에서 Control이 참조되기 때문에 
// 레이아웃 파일은 /read/1, /read/2~~~ 든 주소에서도 공통으로 참조된다.
// 파라미터 값을 사용할 수가 있다.

'use client'
import Link from "next/link";
import { useParams,useRouter } from "next/navigation";

export function Control () {

    const router= useRouter();
    const params=useParams();
    const id = params.id;

  return (
    <ul>
    <li><Link href='/create'>create</Link></li>
      {/* 상항연산자 구문 */}
      {
      id ? (
      <>
        {/* update는 read와 동일 */}
        <li><Link href={`/update/${id}`}>update</Link></li>
        <li>
          <button onClick={async () => {
                // fetch() 사용법
                // 1) const resp = await fetch (주소);
                // 2) const resp = await fetch (주소, 옵션);
                const resp = await fetch(`${process.env.NEXT_PUBLIC_API_URL}topics/${id}`, {
                method : "DELETE",
                });
                await resp.json();
                router.push('/');
                router.refresh();
        }}>delete</button></li>
      </>
      ) : null
    }
    
</ul>
  );
} 