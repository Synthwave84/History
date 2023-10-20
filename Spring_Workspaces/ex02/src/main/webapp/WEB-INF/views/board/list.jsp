<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Sticky Footer Navbar Template · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sticky-footer-navbar/">

    

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/resources/sticky-footer-navbar.css" rel="stylesheet">
  </head>
  <body class="d-flex flex-column h-100">
    
<header>
    <%@include file="/WEB-INF/views/comm/header.jsp" %>
</header>
<!-- Begin page content -->
<main role="main" class="flex-shrink-0">
  <div class="container"> <!-- container 큰 틀을 잡는다 -->
    <section>
      <div class="row"> <!-- <tr>과 같은 느낌. row 안에는 <td>를 합이 12까지 사용 가능하다. -->
          <div class="col-md-12"> <!-- <tr> 하나에 <td>를 하나만 쓰겠다는 의미 -->
            <div class="box">
                <div class="box-header with-border">
              <h3 class="box-title">List</h3>
              </div>
              
              <div class="box-body">
                  
                  <table class="table table-bordered">
                    <tbody>
                        <tr>
                          <th style="width : 10%">번호</th>
                          <th style="width : 45%">제목</th>
                          <th style="width : 15%">작성자</th>
                          <th style="width : 15%">등록일</th>
                          <th style="width : 15%">조회수</th>
                        </tr>
                        <!-- jstl 문법작업 -->
                        <c:forEach items="${list}" var="board"> <!-- var = boardVO class 성격이 된다. -->
                        <tr>
                          <td>${board.bno} </td>
                          <td><a class="move" href="#" data-bno="${board.bno}">${board.title}</a></td>
                          <td>${board.writer}</td>
                          <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
                          <td>${board.viewcount}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                  </table>
              </div>
              
              <div class="box-footer clearfix">
                <div class="row">
                  <div class="col-6">
                  <nav aria-label="...">
                        <ul class="pagination">
                          <!-- 이전 표시여부 -->
                            <c:if test="${pageMaker.prev}">
                              <li class="page-item " >
                                <a href="/board/list?pageNum=${pageMaker.startPage - 1 }" class="page-link">Previous</a>
                              </li>
                            </c:if>
                          <!-- PageDTO(startPage=1, endPage=10, prev=false, next=true, total=2048, 
                          cri=Criteria(pageNum=2, amount=10, type=null, keyword=null)) -->
                            <!-- 현재 진행되고 있는 page가 num으로 들어간다. -->
                            <!-- 1 2 3 4 5 ... 페이지 번호 -->
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                              <li class='page-item ${pageMaker.cri.pageNum == num ? "active":"" }' aria-current="page">
                                <a class="page-link movepage" href="#" data-page="${num }">${num}</a>
                              </li>
                            </c:forEach>
                            <!-- 다음 표시 여부 -->
                            <c:if test="${pageMaker.next}">
                              <li class="page-item">
                              <a class="page-link" href="/board/list?pageNum=${pageMaker.endPage + 1 }">Next</a>
                              </li>
                            </c:if>
                          </ul>
                        </nav>
                        </div>
                        <div class="col-6">
                          <form action="/board/list" method="get">
                              <select name="type">
                                <option selected>검색종류</option>
                                <option value="T">제목</option>
                                <option value="C">내용</option>
                                <option value="W">작성자</option>
                                <option value="TC">제목+내용</option>
                                <option value="TW">제목+작성자</option>
                                <option value="TCW">제목+작성자+내용</option>
                              </select>
                            <input type="text" name="keyword" value=""/>
                            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                            <button type="submit" class="btn btn-primary">검색</button>
                          </form>
                          <!-- 
                          1)페이지 번호
                          [이전] 1 2 3 4 5 [다음] 페이지 이동목적으로 클릭 시 사용됨 
                          
                          2) 목록에서 제목을 클릭 할 때도 동시에 사용. action="board/get"
                          -->
                          <form id="actionForm" action="/board/list" method="get"> 
                            <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
                            <input type="hidden" name="amount" id ="amount" value="${pageMaker.cri.amount}" />
                            <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
                            <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
                          </form>
                        </div>
                      </div>
                  <a id="btn_write" class="btn btn-primary" href="./register" role="button">글쓰기</a>
              </div>
            </div>

          </div>
      </div>
    </section>
  </div>
</main>

<footer class="footer mt-auto py-3">
<%@include file="/WEB-INF/views/comm/footer.jsp" %>
</footer>

<%@include file="/WEB-INF/views/comm/plug-in.jsp" %>  

<script>
  document.getElementById("btn_write").addEventListener("click", btn_write);

  function btn_write() {
      location.href = "/board/register";
  };
  // 폼태그 참조
  let actionForm= document.getElementById("actionForm");

  // <form id"actionForm"> 태그를 참조하여, 필요한 정보 사용.
  // 페이지 번호 클릭시 동작 작업.
  // <a>1</a><a>2</a><a>3</a>....
  const movePages = document.getElementsByClassName("movepage");
  Array.from(movePages).forEach(function (mv_page) {
  // actionForm폼 전송
    mv_page.addEventListener("click", (event) => {
      event.preventDefault();
  //  data-page"1"
  // console.log("페이지번호",event.target.dataset.page);
      document.getElementById("pageNum").value = event.target.dataset.page;
      actionForm.submit(); // /board/list
    
    });
  });

  // 제목클릭 시 이벤트 설정 : 게시물 읽기
  // <a class="move">제목</a>
  //	 즉 제목의 수 만큼 참조하게됨.
  const moves = document.getElementsByClassName("move");
  Array.from(moves).forEach(function (move) {
  // actionForm폼 전송
    move.addEventListener("click", (event) => {
      event.preventDefault();
      let bno=event.target.dataset.bno;
      
      const newInput = document.createElement("input");
      newInput.setAttribute("type", "hidden");
      newInput.setAttribute("name", "bno");
      newInput.setAttribute("value", bno);
      actionForm.setAttribute("action","/board/get");
      actionForm.append(newInput);
      actionForm.submit(); 
    
    });
  });
</script>

  </body>
</html>
    