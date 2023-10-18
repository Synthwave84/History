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
                           <th style="width : 50%">제목</th>
                           <th style="width : 20%">작성자</th>
                           <th style="width : 20%">등록일</th>
                        </tr>
                        <!-- jstl 문법작업 -->
                        <c:forEach items="${list}" var="board"> <!-- var = boardVO class 성격이 된다. -->
                        <tr>
                           <td>${board.bno} </td>
                           <td><a href=" /board/get?bno=${board.bno}">${board.title}</a></td>
                           <td>${board.writer}</td>
                           <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
               
               <div class="box-footer clearfix">
                  <nav aria-label="...">
                          <ul class="pagination">
                            
                            <c:if test="${pageMaker.prev}">
                        <li class="page-item">
                                 <a href="/board/list?pageNum=${pageMaker.startPage - 1 }" class="page-link">Previous</a>
                               </li>
                            </c:if>
                            
                            <!-- 현재 진행되고 있는 page가 num으로 들어간다. -->
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                        <li class='page-item ${pageMaker.cri.pageNum == num ? "active":"" }' aria-current="page">
                                 <a class="page-link" href="/board/list?pageNum=${num }">${num}</a>
                               </li>
                            </c:forEach>
                            
                            <c:if test="${pageMaker.next}">
                               <li class="page-item">
                                 <a class="page-link" href="/board/list?pageNum=${pageMaker.endPage + 1 }">Next</a>
                               </li>
                            </c:if>

                          </ul>
                        </nav>
                  <a class="btn btn-primary" href="./register" role="button">글쓰기</a>
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
   }
</script>
   
  </body>
</html>
    