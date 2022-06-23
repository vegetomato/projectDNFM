$(function() {
		let bnoValue = $('input[name="bno"]').val();
		let replyUL = $('.chat');
		
		let modal = $('.modal');
		let modalInputReply = modal.find('input[name="reply"]');
		let modalInputreplyer = modal.find('input[name="replyer"]');
		let modalInputreplyDate = modal.find('input[name="regDate"]');
			
		let modalModBtn = $('#modalModBtn')
		let modalRemoveBtn =$('#modalRemoveBtn')
		let modalRegisterBtn = $('#modalRegisterBtn')
		let modalClosetBtn = $('#modalClosetBtn')
		
		//모달 등록 이벤트처리 , #은 아이디 선택자 .은 클래스 선택자
		modalRegisterBtn.on('click',function(){
			//input태그 값을 가져오는건 val
			let reply = {
					reply : modalInputReply.val(),
					replyer : modalInputreplyer.val(),
					bno : bnoValue,
			}
			replyService.add(reply,function(result){
				alert(result)
				modal.modal('hide');
				showList(1)
			})
		})
		
		$('.chat').on('click','li',function(){
			let rno = $(this).data('rno');
			replyService.get(rno,function(reply){
				console.log(reply)
				modalInputReply.val(reply.reply);
				modalInputreplyer.val(reply.replyer);
				modalInputreplyDate.val(dislplayTime(reply.updateDate))
									.attr("readonly","readonly");
				modal.data("rno",reply.rno);
				modalInputreplyDate.closest('div').show();
				modalModBtn.show();
				modalRemoveBtn.show();
				modalRegisterBtn.hide();
				modal.modal("show");
			})
		})
		//댓글 등록 모달창
		$('#addReplyBtn').on('click', function(){
			modal.find('input').val('');
			modalInputreplyDate.closest('div').hide();
			modalModBtn.hide();
			modalRemoveBtn.hide();
			modalRegisterBtn.show();

		})

	function showList(page) {
		replyService.getList({ bno: bnoValue, page: page }, function(list) {
			let str = "";
			for (let r of list) {
				str += `
					<li data-rno='${r.rno}'>
						<div>
							<div class='header'>
								<strong class='primary-font'>${r.replyer}</strong>
									<small class='pull-right test-method'>${dislplayTime(r.regDate)}</small>
							</div>
							<p>${r.reply}</p>
						</div>
					</li>`
			}
			replyUL.html(str);
		});
	}
	showList(1);
	
	function dislplayTime(timeValue){
/*		let test = "abcdefg";
		console.log(test.substr(2));*/
		let timeArr = JSON.stringify(timeValue).substr(1).split(",");
		console.log(timeArr[0]); //년
		console.log(timeArr[1]); //월
		console.log(timeArr[2]); //일
		return `${timeArr[0]}년 ${timeArr[1]}월 ${timeArr[2]}일`;	
		}
})