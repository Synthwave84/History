자바스크립트 : 프론트엔드 기술
- 실행환경 : 웹브라우저
- 확장자 : html파일

node.js : 자바스크립트로 백엔드 구현을 해보자는 취지로 개발됨.
확장성 있는 네트워크 애플리케이션 ( 특히 서버사이드) 개발에 사용되는 소프트웨어 플랫폼.

리액트
- 준비환경 : node.js 설치
- Node.js를 설치하면, 리액트를 개발하고, 실행할 수 있는 소프트웨어가 포함되어 있다.


리액트 vs 리액트 네이티브
- 리액트 : 웹 개발 용도
- 리액트 네이티브 : 모바일 개발 용도.

터미널 : 운영체제를 택스트 명렁으로 제어를 하기위한 환경.

버젼 : 
  node --version
  npm --version

npm : Node Package(Software) Manager
  - Node.js로 만들어진 모듈을 웹에서 받아서 설치하고 관리해주는 프로그램

  
Package : 작은 단위의 소프트웨어, 또는 모듈 이라고 한다


npm 기본 사용법
  
  npm install 모듈 이름 (리눅스 터미널마냥 해 주는것)
  create-react-app 모듈
  : 일종의 금형이다. 초기환경을 일일히 설정하지 않고도 리액트 프로젝트를 시작 할 수 있도록
  프리셋을 만들어 놓은 것 이라 보면 된다.

npx : npm 5.2버전 부터 지원한다. 모듈의 일종이라고 볼 수 있다.

  리액트 프로젝트 생성 모듈.

  리액트(CRA) 프로젝트 생성
  npx create-react-app  프로젝트 명

  리액트 프로젝트 생성시 에러 발생
  - Visual Studio Code 재시작
  - 컴퓨터 재시작
  - npm install -g create-react-app : create-react-app 모듈을 global 영역에서 제거