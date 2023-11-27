const express = require('express')
const app = express()

const ejs = require('ejs')  // jsp와 유사한 뷰템플릿
const port = 3000


const mysql = require('mysql2')
const dbconfig = require('./config/db.js')
const conn = mysql.createConnection(dbconfig)
console.log('데이타베이스 연결 성공')



const bodyparser = require('body-parser')

// 설정
app.set("view engine", "ejs");
app.set('views', './views')


app.use(bodyparser.urlencoded({extended: false}))

// 클라이언트 파일(*.css, 이미지파일, *.js 등)
app.use(express.static(__dirname + '/public'))




// 라우팅(경로) 설정.  설명>스프링에서 Controller클래스에서 매핑주소
// req : request객체. 클라이언트에서 전송된 정보를 담당하는 객체.
// res : response객체. 서버에서 클라이언트로 응답하기위한 정보를 담당하는 객체.
app.get('/', (req, res) => {
//   res.send('<h1>Hello World!</h1>') // Hello World! 문자열을 클라이언트(브라우저)로 보내는 작업.
    res.render('index')  // 파일명 : ./views/index.ejs
})

// 매핑주소와 파일명은 일치하지 않아도 된다.
app.get('/testA', (req, res) => {
    // res.send('<h1>testA</h1>')
    res.render('demo')
})

// 주소: testB 파일명: testB.ejs
app.get('/testB', (req, res) => {
    res.render('testB')
})


// 게시판글쓰기
app.get('/write', (req, res) => {
    res.render('write')
})


// nodejs기반으로 서버기능을 생성해주는 코드
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})