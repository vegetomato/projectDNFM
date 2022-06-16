<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<h3>수정페이지</h3><br>
<div class="container">
<form action="modify" method="post">
	<input type="hidden" name="id" value="${member.id }">
	회원 번호 : ${member.id }  <br>
	이름 : <input type="text" name="userName" value="${memeber.userName }"><br>
	이메일 : <input type="text" name="email" value="${memeber.email}"><br>
	이메일 : <input type="text" name="password" value="${memeber.password }"><br>
	<button class="btn btn-warning">수정하기</button>
</form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>