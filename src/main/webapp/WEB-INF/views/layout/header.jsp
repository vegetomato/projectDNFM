<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>던전앤파이터 모바일 커뮤니티</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
<link rel="stylesheet" type="text/css"href="resources/css/reset.css" />
<link rel="stylesheet" type="text/css"href="resources/css/style.css" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light">

  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }">HOME</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/board/list">게시판</a>
    </li>
    <c:if test="${empty sessionScope.email}">
    	<li class="nav-item">
      		<a class="nav-link" href="${contextPath }/member/login">로그인</a>
    	</li>
    </c:if>
     <c:if test="${not empty sessionScope.email}">
    	<li class="nav-item">
    	<form action="${contextPath }/member/logout" id="logoutForm" method="post">
    		<a class="nav-link" href="#">로그아웃</a>
    	</form>
    	</li>
    </c:if>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/list">회원목록</a>
    </li>
       <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/register">회원가입</a>
    </li>
  </ul>
</nav>

<script>
$('#logoutForm a').on('click',function(e){
	e.preventDefault();
	$('#logoutForm').submit();
	
})
</script>
