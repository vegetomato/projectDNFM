<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div class="container">
<form:form action="login" method="post" modelAttribute="member">
<h3>로그인</h3>
	<div>
		이메일 : <form:input path="email"/>
		<form:errors path="email"/>
	</div>
		<div>
		비밀번호 : <form:input path="password" type="password"/>
		<form:errors path="password"/>
	</div>
	<button>로그인</button>
</form:form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>