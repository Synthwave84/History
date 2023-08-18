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