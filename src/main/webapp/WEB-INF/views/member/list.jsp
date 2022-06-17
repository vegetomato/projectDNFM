<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<form action="${contextPath }/member/list" id="listForm">
	<div class="listData">
		<input type="hidden" name="id" id="id" value="">
		<input type="hidden" name="page" id="page" value="${pageMaker.criteria.page }">
		<input type="hidden" name="type" id="type" value="${pageMaker.criteria.type }">
		<input type="hidden" name="keyword" id="keyword" value="${pageMaker.criteria.keyword }">
	</div>		
	</form>
<table class="table">
	<h3>자유 게시판</h3>
	<tr>
		<th>번호</th>
		<th>회원이름</th>
		<th>E-mail</th>
	</tr>
	<c:forEach items="${list}" var="m">
	<tr>
		<td>${m.id }</td>
		<td>
		<a href="${m.id}" class="get">${m.userName }</a>
		</td>
		<td>${m.password }</td>
	</tr>
	</c:forEach>
</table>
<div class="pagination">
<c:if test="${pageMaker.prev }">
<li class="page-item"><a href="${pageMaker.startPage-1 }" class="page-link">이전페이지</a></li>
</c:if>
<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
<li class="page-item"><a href="${pageNum}" class="page-link ${pageMaker.criteria.page == pageNum ? 'on' : '' }">${pageNum}</a></li>
</c:forEach>
<c:if test="${pageMaker.next }">
<li class="page-item"><a href="${pageMaker.endPage+1 }" class="page-link">다음페이지</a></li>
</c:if>
</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
<script>
	$(function(){
		let listForm = $('#listForm')
		$('.pagination a').on('click',function(e){
			e.preventDefault();
		$('.listData').find('#page').val($(this).attr('href'));
		
		if(listForm.find('input[name="keyword"]').val()==''){
			listForm.find('input[name="keyword"]').remove();
			listForm.find('select[name="type"]').remove();
		}
		
		listForm.append($('#page'));
		listForm.submit();
		})
		$('.get').on('click',function(e){
			e.preventDefault();
			let id = $(this).attr('href');
			$('#id').val(id);
			listForm.append($('#id'));
			listForm.append($('#page'));
			listForm.attr("action","get")
			listForm.submit();
		})
		
	})
</script>
<style>
.on{font-weight: 700; color: red}
</style>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>