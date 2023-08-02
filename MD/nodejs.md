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

react 웹 프로젝트 생성
 -  node_modules 폴더
  - public 폴더
  - src 폴더

3개의 폴더로 구성 되어있다.
 - public 폴더 
    index.html : 기본 페이지 : http://localhost:3000/ 주소에 의하여 동작.
      <div id="root"></div> 이 위치에 리액트 실행 결과물이 렌더링 된다.

- src  폴더
    index.js파일에서
    const root = ReactDOM.createRoot(document.getElementById('root'));
    구문이 index.html 파일의 <div id="root"></div>를 참조한다.

    import App from './App': 구문에 의하여

    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(
    <React.StrictMode>
    <App /> - App.js 파일의 function App()를 참조하게된다. 
    </React.StrictMode>
    );

- 실제 리액트 구문이 존재하지만, 어렵고 복잡하여 JSX문법으로 리액트 작업을 한다.

  작업은 JSX문법으로 작업 하지만, 컴파일 과정에서 리액트 문법으로 컨버팅된다.
  변환작업을 하는 도구 = babel
  Babel : 문법을 통일해준다. Node.js 환경에 맞게 해준다.

- 리액트 컴포넌트 :자바스크립트의 함수에 해당함.  
  리액트 컴포넌트로 사용 하는 함수는 함수명을 반드시 대문자로 작성해야 한다.

  기본 구조.

  function App() {
    자바 스크립트 문법작업.
    return (
      JSX 문법작업
    );
  }

- JSX : JavaScript + (XML or HTML) 포함된 형태의 언어.
  공식명 ReactJS
  - 개발분야에서는 JSX 라는 이름으로 통한다.

JSX 구문에서 자바스크립트 사용시 {} 안에 사용해야한다.
또한, XML과 동일하게 부모 요소(루트)가 하나 존재해야한다. 사실상 HTML 문서또한 <html></html>의 
하나의 부모요소로 구성되어있는 것과 동일하다. 

JSX 구문에 컴포넌트 속성작업 : props 

  예 > HTML
    <img src="test.gif" title="꽃">

  예 > JSX 구문에 속성 사용
    <Book name="리액트", numOfPage="500"></Book>90-

  root를 설정할 때,
  <div>태그가 아니라 <> </> (프래그먼트)를 이용 할 수 있다.

  리액트 함수형 컴포넌트.   
    : 자바스크립트 함수 문법을 이용.
    함수명은 대문자로 작성해야한다. 작은단위의 UI(자바스크립트 프로그래밍)가 포함 되어있다.
  
  - 순수 자바스크립트로 작성 -> 파일의 확장자 .js
  - jsx문법이 포함되서 작성 -> jsx

  - import Hello~~; Hello.js -> Hello.jsx 순서대로 파일 참조.

  참고 > 리액트형 클래스 컴포넌트

React Hook

렌더링 : 컴포넌트가 호출되어 그 결과가 웹브라우저 화면에 출력되는
것을 렌더링이라고한다.
