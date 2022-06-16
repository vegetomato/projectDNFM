<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
<form:form action="register" modelAttribute="board">
	제목 : <form:input type="text" path="title" />
	<form:errors path="title" class="error" element="div"/><br>
	내용 :<br> 
	<form:textarea rows="30" cols="50" path="content"/><br>
	작성자 : <form:input type="text" path="writer"/>
	<form:errors path="writer"/><br>
	<button>등록</button>
</form:form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
