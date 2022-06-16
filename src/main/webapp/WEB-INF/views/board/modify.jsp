<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<h3>수정페이지</h3><br>
<div class="container">
<form action="modify" method="post">
	<input type="hidden" name="bno" value="${board.bno }">
	게시물 번호 : ${board.bno }  <br>
	제목 : <input type="text" name="title" value="${board.title }"><br>
	내용 : 
	<textarea rows="" cols="" name="content">${board.content}</textarea><br>
	작성자 : ${board.writer }<br>
	<button class="btn btn-warning">수정하기</button>
</form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>