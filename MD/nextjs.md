Next.js
- 서버사이드 렌더링 (Server Side Rendering)
- 정적 웹 페이지 생성 등 리액트 기반 웹 애플리케이션 기능들을 가능케 하는
  Node.js 위에 빌드 된 오픈소스 개발 웹 프레임워크이다.
  
Next.js 프로젝트 생성
  현재 폴더에 프로젝트 생성시
  npx create-next-app@latest

개발용 실행
  npm run dev  (개발)
  npm run build (빌드)
  npm run start (서비스)
  package.json에 해당명령어가 있다.

layout.js
  레이아웃 파일의 <body>{children}</body> 에서
  렌더링이 이루어진다. 


라우터(라우팅)
  사용자가 접속한 URL에 해당하는 컨텐츠를 응답해주는 작업. 

React 
CSR : Client Side Rendering
Next
React FrameWork
SSR : Server Side Rendering

Full-Stack
Front-end(CSR)
Back-end(SSR)

next.js : 13 폴더 구조
  .next : 개발 및 빌드시 생성된 파일
  node_modules : 패키지 및 모듈 관리
  public : 이미지파일 관리
  src/app : Next.js 에서 개발하는 파일관리.
     layout.js - 에약파일. page.js파일의 실행내용을 포함
     page.js - 예약파일. layout.js팡리 안에 실행내용이 삽입됨.



http://www.abc.com/board/topic
abc.com - domain
board/topic - path
board - segment
topic - segment

next12 vs next 13 라우팅 기술적 차이
- http://www,abc.com/create  create.js

next 13 
  - http://www.abc.com/create create 폴더명으로 라우팅이 자동 연결

mdn HTTP 상태코드

create 폴더에 page.js 파일이 실행된다.
create 폴더에서 layout.js 파일을 찾는다.
없으면, 루트(app)폴더의 layout.js를 찾아, /create/page.js파일의 실행결과가
children에 삽입된다.
 있으면, /create/layout.js 파일의 children에 /create/page.js파일의 실행결과가 삽입되고
    루트 app 폴더의 layout.js에 최종 삽입된다.

/read1, read/2  주소 일부분을 파라미터 값으로 받고자 할 때 사용.
read/[id]/page.js

SPA- Single Page Applicaiton
 ajax 환경처럼, 단일페이지에서 새로고침 없이 부분업데이트 되는 기술.

react
컴포넌트
- client component only.

next.js
컴포넌트
  - server component
      - 사용자와 상호작용 하지 않는 경우. (정적)
      - 백엔드에 접근하면서, 보안적으로 위험한 정보를 주고받는 경우
  - client component.
      - 사용자와 상호작용 하는 경우. ex> 버튼 클릭 시 반응하는 동작. (동적)
      - 서버컴포넌트로 해결되지 않는 경우
      
next.js에서 특정한 작업을 진행하지 않으면, 기본은 Server Component 작업이 된다.

서버 열기 npx json-server --port 9999 --watch db.json

<form method="get">  여기서 메소드를 생략하면 기본은 "get"방식이다.

