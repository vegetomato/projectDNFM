let replyService = (function(){
	
	//댓글 등록
	function add(reply, callback){
		$.ajax({
			type : 'post',
			url : contextPath + '/replies/new',
			data : JSON.stringify(reply),
			contentType : 'application/json;charset=utf-8',
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	} //add end
	//댓글 목록
	function getList(param,callback,error){
		let bno = param.bno;
		let page = param.page || 1;
		
		let url = contextPath + '/replies/pages/' + bno + '/' + page;
		let success = function(data){
			if(callback){callback(data)}
		}
		
		$.getJSON(url,success).fail(function(xhr, status, err){
			if(error) {error(err)}
		});
	}
	//댓글 삭제
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : contextPath + '/replies/'+ rno,
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	} //remove end
	//댓글 수정
	function update(reply, callback, error){
		$.ajax({
			type : 'put',
			url : contextPath + '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : 'application/json;charset=utf-8',
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	} //update end
	
	function get(rno, callback, error){
		$.get(contextPath+"/replies/"+rno,function(result){
			if(callback)callback(result)
		}).fail(function(xhr,status,err){
			if(error) error(err)
		})
	}	
	
	//getList : getList 이렇게 해야 메서드 등록
	return {
		add : add, 
		getList : getList,
		remove : remove,
		update : update,
		get : get
	}
})();

console.log(replyService);