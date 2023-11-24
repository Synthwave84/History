// 라이브러리 설정.
const express = require('express')
const multer = require('multer')
const app = express()

const ejs = require('ejs') // jsp와 유사한 뷰 템플릿
const moment = require('moment')
const port = 3000

const mysql = require('mysql2')
const dbconfig = require('./config/db.js')
const conn = mysql.createConnection(dbconfig) // mysql 연결객체 생성.

console.log('데이터베이스 연결 성공')

// req.body 속성을 사용하여 클라이언트의 정보를 확인할때 사용.
// middleware인 body-parser 패키지가 설치되어 있어야 한다.
const bodyparser = require('body-parser')

// 설정.
app.set("view engine", "ejs");
app.set('views', './views');

app.use(bodyparser.urlencoded({extended: false}))

// 클라이언트 파일(*.css, 이미지파일, *.js(유효성검사 같은 것) 등)
app.use(express.static(__dirname + '/public'))

// 라우팅(경로) 설정. 설명> 스프링에서 Controller 클래스에서의 매핑주소.
// req : requsest객체. 클라이언트에서 전송된 정보를 담당하는 객체.
// res : response객체. 서버에서 클라이언트로 응답하기 위한 정보를 담당하는 객체.
app.get('/', (req, res) => {
    // res.send('<h1>Hello World!</h1>') // Hello World! 문자열을 클라이언트(브라우저)로 보내는 작업.
    res.render('index') // 파일명 : ./views/index.ejs

})

app.get('/testA', (req, res) => {
    // res.send('<h1>testA</h1>')
    res.render('demo')
})

app.get('/testB', (req, res) => {
    res.render('testB')
})

// 게시판 글쓰기
app.get('/write', (req, res) => {
    res.render('write')
})

// 게시판 글쓰기 저장
app.post('/writePro', (req, res) => {
	// console.log("writePro");
	console.log(req.body);

	const title = req.body.title;
	const writer = req.body.writer;
	const content = req.body.content;

	var sql = `insert into board(title, content, writer) values(?, ?, ?)`;
	var values = [title, content, writer];

	conn.query(sql, values, function(err, result){
			if(err) throw err;
			console.log("데이터 삽입" + result.length)
	})
})

// 게시판 목록

app.get('/list', (req,res) => {
    var sql = `select bno, title, writer, regdate from board order by bno desc;`
    conn.query(sql, function(err,results, field) {
        if(err) throw err;
        // 파일명 (list.ejs)
        // {lists = ejs내에서 사용할 데이터명 (model.addAttributes와 비슷함)}
        res.render('list' ,{lists : results}) 
    
    })
})

// 게시글 조회
app.get("/get", (req,res) => {
  var bno = req.query.bno;
  var sql = `select bno, content, title, writer, regdate from board where bno = ${bno}`
	conn.query(sql, function(err, result) {
		if(err) throw err;
		res.render("get",{data: result[0]})
	})
})

// 게시글 수정폼
app.get("/modify", (req,res) => {
  var bno = req.query.bno;
  var sql = `select bno, content, title, writer, regdate from board where bno = ${bno}`
	conn.query(sql, function(err, result) {
		if(err) throw err;
		res.render("modify",{data: result[0]})
	})
})

// 게시글 수정
// 게시판 수정하기
app.post("/modifyPro", (req, res) => {
  // console.log("수정하기", req.body);

  const bno = req.body.bno;
  const title = req.body.title;
  const content = req.body.content;
  
  var sql = `update board set title=?, content=? where bno=?`
  var values = [title, content, bno]

  conn.query(sql, values, function(err, result) {
    if(err) throw err;
    res.send("<script>alert('게시물이 수정됨'); location.href='/list';</script>")
  })
})

// 게시글 삭제
app.get("/delete", (req,res) => {
    var bno = req.query.bno;
    var sql = `delete from board where bno = ${bno}`
    var sql = 'delete from board where bno =' + bno
    conn.query(sql, function(err,result) {
        if(err) throw err;

        res.send("<script>alert('ㅇㅇ삭제함 ㅋ');location.href='list';</script>")
    })
})

// 파일 업로드
app.get("/up_write", (req,res) => {
	res.render("up_write")
})
// nodejs기반으로 서버를 실행시켜주는 구문.
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
