<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="getData">
		<input type="hidden" name="page" id="page" value="${param.page }">
		<input type="hidden" name="type" id="type" value="${param.type }">
		<input type="hidden" name="keyword" id="keyword" value="${param.keyword }">
	</div>
	<form id="getForm">
		<input type="hidden" name="id" value="${member.id}">
		<div>
			<h3>이름 :${member.userName }</h3>
			<p>작성자 : ${member.email}</p>
			<p>비밀번호 : ${member.password}</p>
		</div>
		<button class="btn btn-warning modify">수정</button>
		<button class="btn btn-danger remove">삭제</button>
		<button class="btn btn-primary list">목록</button>
	</form>
</div>
<%@ include file="../layout/footer.jsp"%>
<script>
	$(function() {
		let getForm = $("#getForm");
		$('#getForm .list').on('click', function() {
			getForm.empty();
			getForm.append($('#page'));
			getForm.append($('#type'));
			getForm.append($('#keyword'));
			getForm.attr("action", "list");
			getForm.submit();
		})
		$('#getForm .modify').on('click', function() {
			getForm.attr("action", "modify");
			getForm.submit();
		})
		$('#getForm .remove').on('click', function() {
			getForm.attr("method", "post");
			getForm.attr("action", "remove");
			getForm.submit();
		});
	})
</script>