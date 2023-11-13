<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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



    <!-- Favicons -->


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
  <!-- Fixed navbar -->
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
					<h3 class="box-title">List</h3>
					</div>

					<div class="box-body">
						<table class="table table-bordered">
							<tbody><tr>
								<th style="width: 10%">번호</th>
								<th style="width: 40%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 20%">등록일</th>
								<th style="width: 10%">조회수</th>
							</tr>
							<c:forEach items="${list }" var="board">
							<tr>
								<td>${board.bno }</td>
								<td><a class="move" href="#" data-bno="${board.bno }">${board.title }</a></td>
								<td>${board.writer }</td>
								<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd" /></td>
								<td>${board.viewcount }</td>
							</tr>
							</c:forEach>
							</tbody></table>
					</div>
					<div class="box-footer clearfix">
						<div class="row">
							<div class="col-6">
								<nav aria-label="...">
								<ul class="pagination">
									<!-- 이전 표시여부 -->
									<c:if test="${pageMaker.prev }">
										<li class="page-item">
											<a href="/board/list?pageNum=${pageMaker.startPage - 1 }" class="page-link">Previous</a>
										</li>
									</c:if>
									<!-- 페이지번호 출력 -->
									<!-- 1	2	3	4	5 6	7	8	9	10  [다음] -->
									<!-- [이전] 11	12	13	14	15 16	17	18	19	20   -->
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
										<li class='page-item ${pageMaker.cri.pageNum ==  num ? "active":"" }'aria-current="page">
											<a class="page-link movepage" href="#" data-page="${num }">${num }</a>
										</li>
									</c:forEach>
									
									<!--  다음 표시여부 -->
									<c:if test="${pageMaker.next }">
										<li class="page-item">
										<a href="/board/list?pageNum=${pageMaker.endPage + 1 }" class="page-link" href="#">Next</a>
										</li>
									</c:if>
									
								</ul>
								</nav>
							</div>
							<div class="col-6">
								<form action="/board/list" method="get" >
									<select name="type">
										<option selected>검색종류선택</option>
										<option value="T" ${pageMaker.cri.type == 'T'? 'selected': ''}>제목</option>
										<option value="C" ${pageMaker.cri.type == 'C'? 'selected': ''}>내용</option>
										<option value="W" ${pageMaker.cri.type == 'W'? 'selected': ''}>작성자</option>
										<option value="TC" ${pageMaker.cri.type == 'TC'? 'selected': ''}>제목 or 내용</option>
										<option value="TW" ${pageMaker.cri.type == 'TW'? 'selected': ''}>제목 or 작성자</option>
										<option value="TWC" ${pageMaker.cri.type == 'TWC'? 'selected': ''}>제목 or 작성자 or 내용</option>
									</select>
									<input type="text" name="keyword" value="${pageMaker.cri.keyword}" />
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
									<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
									<button type="submit" class="btn btn-primary">검색</button>
								</form>
								<!--1)페이지번호 클릭할 때 사용  [이전]  1	2	3	4	5 [다음]  action="/board/list"-->
								<!--2)목록에서 제목 클릭할 때 사용  action="/board/get" -->
								<form id="actionForm" action="/board/list" method="get">
									<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
									<input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
									<input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
									<input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
									<input type="hidden" name="bno" id="bno" />
								</form>
							</div>
						</div>
						<a class="btn btn-primary" href="/board/register" role="button">글쓰기</a>
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
	// 폼태그 참조.
	let actionForm = document.getElementById("actionForm");

	// <form id="actionForm"> 태그를 참조하여, 필요한 정보를 변경및 사용
	// 1)페이지번호 클릭시 동작되는 이벤트 설정
	// <a class="movepage">1</a><a class="movepage">2</a><a class="movepage">3</a><a>4</a><a>5</a>
	const movePages = document.getElementsByClassName("movepage");
	Array.from(movePages).forEach(function(mv_page) {
		// actionForm폼 전송
		mv_page.addEventListener("click", function(event) {
			event.preventDefault();
			// data-page="1"
			//console.log("페이지번호", event.target.dataset.page);
			document.getElementById("pageNum").value = event.target.dataset.page;
			actionForm.setAttribute("action", "/board/list");
			actionForm.submit();  //  /board/list
		});
	});

	// 2)제목클릭시 이벤트 설정 : 게시물읽기
	// 10개 <a class="move">제목</a>
	const moves = document.getElementsByClassName("move");
	Array.from(moves).forEach(function(move) {
		// actionForm폼 전송
		move.addEventListener("click", function(event) {
			event.preventDefault();

			//bno 제거작업
			// 목록에서 제목 클릭후 게시물읽기에서 뒤로버튼에 의하여 목록으로 돌아가서
			// 다시 제목을 클릭하면, bno파라미터가 추가되기때문에
			// 기존 bno파라미터를 삭제해야 한다.
			document.getElementById("bno").remove();

			// <a href="#" data-bno="게시물번호" data-name="값" data-title="값">
			let bno = event.target.dataset.bno;
			// <input type='hidden' name='bno' value='게시물번호'>
			// HTML DOM문법
			const newInput = document.createElement("input");
			newInput.setAttribute("type", "hidden");
			newInput.setAttribute("name", "bno");
			newInput.setAttribute("id", "bno");
			newInput.setAttribute("value", bno);
			actionForm.appendChild(newInput);

			actionForm.setAttribute("action", "/board/get");
			actionForm.submit();
		});
	});
  </script>
  </body>
</html>
    