const express = require('express')
const multer = require('multer')
const path = require('path')

// 변수에 업로드 관련설정정보 저장
var storage = multer.diskStorage({
    // 업로드 폴더설정
    destination(req, file, cb) {
        cb(null, 'upload/');
    },
    // 파일명 설정 : 중복이름 해결
    filename(req, file, cb) {
        const ext = path.extname(file.originalname);
        const baseName = path.basename(file.originalname, ext);
        //현재 시간정보를 이용하여, 중복되지 않는 파일명 이름생성.
        const fileName = baseName + "_" + Date.now() + ext;
        console.log("파일명", fileName);
        cb(null, fileName);

    },
    limits : {fileSize: 5 * 1024 * 1024} // 5mb제한
});

// 업로드 관련설정작업
var upload = multer({storage : storage})


const app = express()

const ejs = require('ejs')  // jsp와 유사한 뷰템플릿
const moment = require('moment')
const port = 3000


// const mysql = require('mysql2')
// const dbconfig = require('./config/db.js')
// const conn = mysql.createConnection(dbconfig)   // mysql연결객체 생성

const conn = require('./config/dbconn.js')
console.log('데이타베이스 연결 성공')


// req.body 속성을 사용해서 클라이언트 정보를 확인할 때 사용.
// middleware인 body-parser 패키지가 설치되어야 한다.
const bodyparser = require('body-parser')

// 설정
app.set("view engine", "ejs");
app.set('views', './views')


app.use(bodyparser.urlencoded({extended: false}))

// 클라이언트 파일(*.css, 이미지파일, *.js 등)
app.use(express.static(__dirname + '/public'))

// 업로드 폴더 경로
app.use('/upload', express.static(__dirname + '/upload'));




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
    res.render('write') // write.ejs
})

//게시판글쓰기 저장
app.post('/writePro', (req, res) => {
    // console.log("writePro");
    // console.log(req.body);

    const title = req.body.title;
    const writer = req.body.writer;
    const content = req.body.content;

    var sql = `insert into board(title, content, writer) values(?, ?, ?)`
    var values = [title, writer, content]

    conn.query(sql, values, function(err, result) {
        if(err) throw err;
        console.log("데이타 삽입")
        // res.send("<script>alert('게시물이 등록됨');location.href='/list';</script>")
        res.redirect('/list');
    })
}) 

//게시판 목록
app.get("/list", (req, res) => {
    var sql = `select bno, title, content, writer, regdate from board order by bno desc`
    conn.query(sql, function(err, results, field) {
        if(err) throw err; // 예외처리
        res.render('list', {lists : results})    // list.ejs
    })
})

//게시판 조회
app.get("/get", (req, res) => {
    var bno = req.query.bno;
    var sql = `select bno, title, content, writer, regdate from board where bno = ${bno}`
    conn.query(sql, function(err, result) {
        if(err) throw err;
        res.render("get", {data: result[0]})
    })
})

//게시판 수정페이지
app.get("/modify", (req, res) => {
    var bno = req.query.bno;
    var sql = `select bno, title, content, writer, regdate from board where bno = ${bno}`
    conn.query(sql, function(err, result) {
        if(err) throw err;
        res.render("modify", {data: result[0]})
    })
})

//게시판 수정하기
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



//게시판 삭제
app.get("/delete", (req, res) => {
    var bno = req.query.bno;
    var sql = `delete from board where bno = ${bno}`  // 백틱안에 변수를 사용
    // var sql = 'delete from board where bno =' +  bno
    conn.query(sql, function(err, result) {
        if(err) throw err;

        res.send("<script>alert('게시물이 삭제됨');location.href='/list';</script>")
    })
})


//파일업로드 폼
app.get('/up_write', (req, res) => {
    res.render('up_write')
})

//파일업로드 저장
app.post('/up_writePro', upload.single('p_img') ,(req, res) => {
    console.log(req.file); // 업로된 파일정보 확인
    console.log(req.body); // 일반 입력텍스트정보 확인

    const name = req.body.p_name;
    const savefname = req.file.filename;
    const originfname = req.file.originalname;

    var sql = `insert into product(p_name, p_s_img, p_o_img) values(?,?,?)`
    var values = [name, savefname, originfname]

    conn.query(sql, values, function(err, result) {
        if(err) throw err;
        res.send("<script>alert('상품 등록됨'); location.href='/pro_list';</script>")
    })
})

//상품리스트
app.get("/pro_list", (req, res) => {
    var sql = ` select p_code, p_name, p_s_img, p_o_img, regdate from product order by p_code desc`
    conn.query(sql, function(err, results, field) {
        if(err) throw err; // 예외처리
        res.render('pro_list', {lists : results})    // pro_list.ejs
    })
})

// nodejs기반으로 서버기능을 생성해주는 코드
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})