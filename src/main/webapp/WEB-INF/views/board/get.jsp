<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${contextPath }/resources/js/get.js"></script>
<div class="container">
	<div class="getData">
		<input type="hidden" name="page" id="page" value="${param.page }">
		<input type="hidden" name="type" id="type" value="${param.type }">
		<input type="hidden" name="keyword" id="keyword"
			value="${param.keyword }">
	</div>
	<form id="getForm">
		<input type="hidden" name="bno" value="${board.bno}">
		<div>
			<h3>${board.title }</h3>
			<p>작성자 : ${board.writer }</p>
			<p>
				등록일 :
				<fmt:parseDate var="regDate" value="${board.regDate }"
					pattern="yyyy-MM-dd'T'HH:mm:ss" />
				<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
				<br> 수정일 :
				<fmt:parseDate var="updateDate" value="${board.updateDate }"
					pattern="yyyy-MM-dd'T'HH:mm:ss" />
				<fmt:formatDate value="${updateDate}"
					pattern="yyyy년 MM월 dd일 HH시 mm분" />
			</p>
			<p>${board.content }</p>
		</div>
		<button class="btn btn-warning modify">수정</button>
		<button class="btn btn-danger remove">삭제</button>
		<button class="btn btn-primary list">목록</button>
	</form>
<!-- 댓글 등록 -->
	<button type="button" id="addReplyBtn" class="btn btn-primary" data-toggle="modal"
		data-target="#replyForm">댓글 달기</button>
	<div class="row">
	<hr>
<!-- 댓글 -->	
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="test">댓글을 달아주세요</h4>
				</div>
				<div class="panel-body">
					<ul class="chat">
						
					</ul>
				</div>
			</div>
			<!-- pannel end -->
		</div>
		<!-- col end -->
	</div>
	<!-- row end -->
</div>
<!-- container end -->

<!-- Modal -->
<div class="modal fade" id="replyForm" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">댓글 달기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="reply">내용입력</label>
					<input class="form-control" name="reply" id="reply">
				</div>
				<div class="form-group">
					<label for="replyer">작성자</label>
					<input class="form-control" name="replyer" id="replyer">
				</div>
				<div class="form-group">
					<label for="regDate">등록일</label>
					<input class="form-control" name="regDate" id="regDate">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
				<button type="button" class="btn btn-primary" id="modalRegisterBtn">등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>	
			</div>
		</div>
	</div>
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
	


	// 댓글 등록 테스트
	/* $(function(){
		let bnoValue = $('input[name="bno"]').val();
		let reply = {
				bno : bnoValue,
				reply : "ajax 댓글 등록 테스트",
				replyer : "테스터"
		};
		let callback = function(result){
			alert('결과 : ' + result);
		}
		replyService.add(reply,callback);
	})
	 */	
	 $(function(){
		 let bnoValue = $('input[name="bno"]').val();
		 
		 replyService.getList({bno:bnoValue},function(list){
			/* for(let i = 0, len = list.length || 0; i<len; i++){
				console.log(list[i])
			}  */
			for(let reply of list){
				//console.log(reply)
			}
		 })
	 })

	 $(function(){
		 function updateTest(){
			 replyService.update({
				 rno : 5,
				 bno : 1,
				 reply : "제발 수정 가즈아~"
			 },function(result){
				 alert(result)
			 })
		 }
		 function deleteTest(){
			 replyService.remove(4,function(result){
				 alert(result);
			 },function(){
				 alert('실패')
			 })
		 }
		 //updateTest();
		// deleteTest();
	 })
</script>