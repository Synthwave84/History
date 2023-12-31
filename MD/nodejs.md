자바스크립트 : 프론트엔드 기술
- 실행환경 : 웹브라우저
- 확장자 : html파일

node.js : 자바스크립트로 백엔드 구현을 해보자는 취지로 개발됨.
확장성 있는 네트워크 애플리케이션 ( 특히 서버사이드) 개발에 사용되는 소프트웨어 플랫폼.

리액트
- 준비환경 : node.js 설치
- Node.js를 설치하면, 리액트를 개발하고, 실행할 수 있는 소프트웨어가 포함되어 있다.


React UI 
 -  UI방식
    1> 함수형 컴포넌트 
    2> 클래스형 컴포넌트


리액트
  상위에서 선언한 변수를 다른 또는 하위 함수컴포넌트에서 직접 참조 할 수가 없다.

  - props 속성으로 제공하며, 참조가 가능하다. 
    다만, 계층이 깊으면 작업이 복잡하고 산만해지기 때문에, 계층이 짧은 2단계정도에서
    props 속성 사용이 적당하다
  
  - 계층이 깊으면, Context Api를 사용한다



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

React의 변수
  - 일반변수 : 함수가 재 실행되면 매번 초기화된다. 
  - useRef 변수 : 함수가 재 실행되어도, 값이 유지된다. 
  - useState 변수 : 값이 변경되면 함수가 재 실행되며, 재 렌더링 된다.


useState가 관리하는 변수의 데이터타입
  
  - 원시 데이터 타입 : String, Number, Bigint, Boolean, Undefined, Null, Symbol
  = 원시 데이터 타입은, 말 그대로 값을 가지고 있는 것이기 때문에, useState에서는
     값이 변하면 바로 반응을 할 수 있다.
     즉 Primitive 데이터 타입은, 비유를 하자면 사람 그 자체다. 그 자체가 값이다.
     ex-> const [id, setId] = useState(1);
             setId(2);

  - Object데이터 타입 : Object, Array, Date
  = 그러나 Object 데이터 타입은 내부의 값이 변경이 되어도 반응하지 않는다.
      이는 Object데이터 타입은, 실질적인 데이터를 가지고 있는 것이 아니라,
      데이터가 위치한 주소를 참조하고 있기 때문이다. 즉, 내부의 데이터가 바뀌어도,
      주소자체는 변경되지 않는다. 마치 Object 데이터타입은, 집 과 같고, 내부의 사람이
      변경되는 것과 동일하다. 즉 집의 위치는 변하지 않는다.

      ex-> const [id, setId] = useState([1]);
              setId (id.push(1)); -- 이럴때는 변경되지 아니 한다.

npm install reactor-router-dom@5

https://v5.reactrouter.com/web/guides/quick-start

npx create-react-app

import {BrowserRouter, Route, Routes} from './react-router-dom';
  
라우팅 = 사용자가 요청한 주소(URL)에 해당하는 페이지를 보여주는것

리액트 관점

주소를 요청시 함수 컴포넌트가 실행이 되어 결과를 받게된다.
결과 = jsx 구문

웹 프로젝트 
    
  - 단일 페이지로 구성 (Single Page Application ) 리액트, 뷰, 앵글러 지원
    일정관리 애플리케이션 : 단일 페이지.

  
  - 여러 페이지로 구성 (Multi Page Application) 기본


BrowserRouter vs HashRouter

BrowserRouter  
 
 - 주소가 일반적인 형태
 - 검색엔진(로봇)에 노출이 된다.
 - 배포가 다소 복잡하다.
 - 새로고침하거나 URL로 직접 접근할 경우 경로를 찾지 못하는 에러가 발생한다.
 

HashRouter 

 - 주소에 #이 붙는다.
 - 검색엔진(로봇)에게 노출이 되지 않는다. 적합하지 않다.
 - 배포가 다소 간단하다.
 - '#' 해시를 사용하면 서버에 요청하지 않기 때문에, 새로고침 하거나 URL로 직접 접근해도
   에러를 발생시키지 않는다. 


REDUX 

리액트(React)프로젝트 생성

Redux = 상태관리 라이브러리
     1. Props를 사용하지 않고 상태 관리.
     2. 중앙에서 상태관리를 일괄적으로 할 때 사용. 

- 리덕스 라이브러리 설치

  npm i redux react-redux
  npm i --save-dev redux-devtools-extension

- 리액트 리덕스 라이브러리 설치

  리액트 프로젝트와 리덕스 라이브러리를 연결(바인딩) 하는 기능.
  
주제 : 리액트 프로젝트에 redux toolkit을 통한 리덕스작업 주비 및 빌드, 배포 테스트
React 배포작업 - 빌드 npm run build
  React  프로젝트 - build폴더 생성
  build폴더 안에 들어있는 것들이, 서비스 될때 실제로 사용되는 것이다.

1. 터미널 하단 내용 중 npm install -g serve 복붙 또는 npm i -g serve 라고 작성해서 실행
2. 마찬가지로 하단 내용 중 serve -s build 복붙하되 앞에 npx 붙여  npx serve -s build 형태로 작성해서 실행 

* npm install -g serve: 웹서버 기능 프로그램

3. 네트워크 주소는 각자 다르게 나타나는데, 강사님의 경우 http://192.168.0.48:3000 이 형태로 강사님 네트워크에 접속 테스트



  리덕스 작업의 사용 선택 기준
    - 프로젝트 규모 여부
          리덕스 
          Context API
    - 비동기 작업: fetch()
          리덕스
          Context API

https://www.charlezz.com/?p=44767


serve 웹서버 설치.
  npm install -g serve
  실행
  npx serve -s build (-s = 스타트)

  설명: build 폴더를 루트로 설정하여, 서비스
  Ctrl+c = 작업중지 

URL 
- URL은 링크에 확장자를 포함한다. 또한 확장자가 있어도 URI가 될 수 있다. 
  WWW.ABC.COM/INDEX.HTML

URI
- URI는 파일 확장자를 포함하지 아니한다. 확장자가 없을 경우 URL은 될 수 없다.
  즉 주소 자체만을 이야기 할 경우. URI, 파일명 까지 포함하면 URL이다.
  WWW.ABC.COM/INDEX


URI의 구조
   일반 URI는 다음과 같은 형태를 나타낸다.

- scheme:[//[user[:password]@]host[:port]][/path][?query][#fragment]
- scheme : 사용할 프로토콜을 뜻하며 웹에서는 http 또는 https를 사용
- user와 password : (서버에 있는) 데이터에 접근하기 위한 사용자의 이름과 비밀번호
- host와 port : 접근할 대상(서버)의 호스트명과 포트번호
- path : 접근할 대상(서버)의 경로에 대한 상세 정보
- query : 접근할 대상에 전달하는 추가적인 정보 (파라미터)
- fragment : 메인 리소스 내에 존재하는 서브 리소스에 접근할 때 이를 식별하기 위한 정보

스타일드 컴포넌트
https://styled-components.com/



노드 서버 
npm install express

node JS 기반 백엔드 구현

- 웹프레임워크 미들웨어 (Express)
