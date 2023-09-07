import Image from 'next/image'





export default function Home() {
  
  // return 값이 layout.js의 children 변수에 삽입된다.
  // 이미지파일은 정적자원을 관리하는 public 폴더를 사용한다. 
  return (
  <>
  <h1>Welcome</h1>
  Hello Node.js!
  <p><img src="/Hand.png" width="80" alt='' /></p>
  </>
  )
}
