<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title mt-5">Register</h3>
					</div>

		<!-- BoardVO의 컨텐츠 내용과 동일하게 작성. -->
		<!-- 절대경로 /board/register -->
		<form role="form" method="post" action="./register">
			<div class="box-body">
			<div class="form-group">
				<label for="subject">Title</label>
				<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력하세요">
			</div>
			<div class="form-group">
				<label for="author">Writer</label>
				<input type="text" class="form-control" name="author" id="author" placeholder="작성자 입력">
			</div>
			<div class="form-group">
				<label>Contents</label>
				<textarea class="form-control" rows="3" name="content" placeholder="내용입력"></textarea>
			</div>
			</div>
			
			<div class="box-footer">
			<button type="submit" class="btn btn-primary">저장</button>
			<button type="reset" class="btn btn-primary">취소</button>
			</div>
			</form>
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