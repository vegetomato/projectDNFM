<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="listData">
		<input type="hidden" name="bno" id="bno" value="">
		<input type="hidden" name="page" id="page" value="${pageMaker.criteria.page }">
		<input type="hidden" name="type" id="type" value="${pageMaker.criteria.type }">
		<input type="hidden" name="keyword" id="keyword" value="${pageMaker.criteria.keyword }">
	</div>
	<form action="${contextPath }/board/list" id="listForm">
		<div>
			<select name="type">
				<option value="">====</option>
				<option value="T" ${pageMaker.criteria.type eq 'T' ? 'selected':'' }>제목</option>
				<option value="C" ${pageMaker.criteria.type eq 'C' ? 'selected':'' }>내용</option>
				<option value="W" ${pageMaker.criteria.type eq 'W' ? 'selected':'' }>작성자</option>
			</select>
			<input type="text" name="keyword" value="${pageMaker.criteria.keyword }">
		</div>
	</form>
<table class="table">
	<h3>자유 게시판</h3>
	<a href="register" class="btn btn-primary">글쓰기</a>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>수정일</th>
	</tr>
	<c:forEach items="${list}" var="b">
	<tr>
		<td>${b.bno }</td>
		<td>
		<a href="${b.bno}" class="get">${b.title }</a>
		</td>
		<td>${b.writer }</td>
		<td>
		<fmt:parseDate var="regDate" value="${b.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
		<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
		</td>
		<td>
		<fmt:parseDate var="updateDate" value="${b.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
		<fmt:formatDate value="${updateDate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
		</td>
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
<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1 }">다음페이지</a></li>
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
			let bno = $(this).attr('href');
			$('#bno').val(bno);
			listForm.append($('#bno'));
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