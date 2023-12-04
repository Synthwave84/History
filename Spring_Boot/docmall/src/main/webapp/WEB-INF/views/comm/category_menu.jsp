<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="category_menu">
	<ul class="nav justify-content-center" id="first_category">
	<c:forEach items="${firstCategoryList }" var="category">
	  <li class="nav-item">
	    <a class="nav-link active" href="#" data-cg_code="${category.cg_code }">${category.cg_name }</a>
	  </li>
	</c:forEach>
	</ul>
</div>
