const express = require('express')
const app = express()
const ejs = require('ejs')

const port = 3000

// -설정
// 화면 엔진은 ejs로 설정한다. = jsp와 동일한 개념
app.set("view engine", "ejs");
app.set("views", './views');

// 클라이언트 파일리소스 (css,js,img etc..)
app.use(express.static(__dirname + '/public'))


// 라우팅 설정 > 설명 = 스프링에서 Controller클래스 매핑주소와 동일.
// req = request객체 = 클라이언트에서 전송된 정보 담당.
// res = response객체 = 서버에서 클라이언트로 응답하기위한 경로를 제공해주는 객체
app.get('/', (req, res) => {
  // res.send('<h1>Hello World!!</h1>')
  // 파일명 ./views/index.ejs
  res.render('index')
})

// 매핑주소와 파일명은 일치하지 않아도 된다. 주소 = testA 파일명 demo.ejs
app.get('/testA' , (req,res) => {
  // res.send('<h1>testA</h1>')
    res.render('demo')
})

// 주소 : testB 파일명 : testB.ejs
app.get('/testB', (req,res) => {

  res.render('testB')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})