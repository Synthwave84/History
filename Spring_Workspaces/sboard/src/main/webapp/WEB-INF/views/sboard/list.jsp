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
  <div class="container"> 
    <section>
      <div class="row">
          <div class="col-md-12"> 
            <div class="box">
                <div class="box-header with-border">
              <h3 class="box-title">List</h3>1
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
                        <c:forEach items="${list}" var="board"> 
                        <tr>
                          <td>${board.idx} </td>
                          <td><a class="move" href="#" data-idx="${board.idx}">${board.subject}</a></td>
                          <td>${board.author}</td>
                          <td><fmt:formatDate value="${board.createdate}" pattern="yyyy-MM-dd" /></td>
                          <td>${board.readcount}</td>
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
                        
                            <c:if test="${pageInfo.prev}">
                              <li class="page-item " >
                                <a href="/sboard/list?pgNum=${pageInfo.stPage -1}" class="page-link">Previous</a>
                              </li>
                            </c:if>
                         
                            <c:forEach begin="${pageInfo.stPage}" end="${pageInfo.edPage}" var="num">
                              <li class='page-item ${pageInfo.cri.pgNum == num ? "active":"" }' aria-current="page">
                                <a class="page-link movepage" href="#" data-page="${num }">${num }</a>
                              </li>
                            </c:forEach>
                            <c:if test="${pageInfo.next}">
                              <li class="page-item">
                              <a class="page-link" href="/sboard/list?pgNum=${pageInfo.edPage + 1 }">Next</a>
                              </li>
                            </c:if>
                          </ul>
                        </nav>
                        </div>
                        <!-- 검색창 작업 -->
                        <div class="col-6">
                          <form action="/sboard/list" method="get">
                              <select name="type">
                                <option selected>검색종류</option>
                                <option value="S" ${pageInfo.cri.type == 'S'? 'selected' :''}>제목</option>
                                <option value="C" ${pageInfo.cri.type == 'C'? 'selected' :''}>내용</option>
                                <option value="A" ${pageInfo.cri.type == 'A'? 'selected' :''}>작성자</option>
                                <option value="SC" ${pageInfo.cri.type == 'SC'? 'selected' :''}>제목+내용</option>
                                <option value="SA" ${pageInfo.cri.type == 'SA'? 'selected' :''}>제목+작성자</option>
                                <option value="SCA" ${pageInfo.cri.type == 'SCA'? 'selected' :''}>제목+작성자+내용</option>
                              </select>
                            <input type="text" name="keyword" value="${pageInfo.cri.keyword}"/>
                            <input type="hidden" name="pgNum" value="${pageInfo.cri.pgNum}" />
                            <input type="hidden" name="amount" value="${pageInfo.cri.amount}" />
                            <button type="submit" class="btn btn-primary">검색</button>
                          </form>
                          <form id="actionForm" action="/sboard/list" method="get"> 
                            <input type="hidden" name="pgNum" id="pgNum" value="${pageInfo.cri.pgNum}" />
                            <input type="hidden" name="amount" id ="amount" value="${pageInfo.cri.amount}" />
                            <input type="hidden" name="type" id="type" value="${pageInfo.cri.type}" />
                            <input type="hidden" name="keyword" id="keyword" value="${pageInfo.cri.keyword}" />
                            <input type="hidden" name="idx" id="idx" />
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
    location.href = "/sboard/register";
  };
  
  let actionForm= document.getElementById("actionForm");


  const movePages = document.getElementsByClassName("movepage");
  Array.from(movePages).forEach(function (mv_page) {
 
   	  	mv_page.addEventListener("click", (event) => {
      	event.preventDefault();
      	document.getElementById("pgNum").value = event.target.dataset.page;
      	actionForm.submit(); 
    
    	});
  });

  const moves = document.getElementsByClassName("move");
  Array.from(moves).forEach(function (move) {
    move.addEventListener("click", (event) => {
      event.preventDefault();

      document.getElementById("idx").remove();
      
      let idx=event.target.dataset.idx;

      const newInput = document.createElement("input");
      newInput.setAttribute("type", "hidden");
      newInput.setAttribute("name", "idx");
      newInput.setAttribute("id","idx");
      newInput.setAttribute("value", idx);
      actionForm.setAttribute("action","/sboard/get");
      actionForm.append(newInput);
      actionForm.submit(); 
    
    });
  });
</script>

  </body>
</html>
    