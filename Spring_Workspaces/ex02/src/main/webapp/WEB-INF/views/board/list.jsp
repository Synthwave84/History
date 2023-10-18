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
  <%@include file="/WEB-INF/views//comm/header.jsp" %>
</header>

<!-- Begin page content -->
<main role="main" class="flex-shrink-0">
  <div class="container">
      	<section>
  		<div class="row">
  		
  			<div class="col-md-12">
  				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Bordered Table</h3>
					</div>
					
					<div class="box-body">
						<table class="table table-bordered">
						<tbody>
						<tr>
							<th style="width: 10%">번호</th>
							<th style="width: 60%">제목</th>
							<th style="width: 10%">작성자</th>
							<th style="width: 15%">등록일</th>
						</tr>
						<!-- JSTL문법 작업 -->
						<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.bno}</td>
							<td><a href="/board/get?bno=${board.bno}">${board.title}</a></td>
							<td>${board.writer}</td>
							<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/> </td>
					
						</tr>
						</c:forEach>
					</tbody></table>
					</div>
					
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">»</a></li>
						</ul>
						<a class="btn btn-primary" href="./register" role="button">글쓰기</a>
					</div>
					</div>
  	</div>
  </div>
</section>
  </div>
</main>

<footer class="footer mt-auto py-3">
  <%@include file="/WEB-INF/views//comm/footer.jsp" %>
</footer>

<%@include file="/WEB-INF/views//comm/plug-in.jsp" %>
      
  </body>
</html>