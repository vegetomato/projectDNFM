package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.mapper.ReplyMapper;
import com.jafa.model.Criteria;
import com.jafa.model.ReplyVO;

import lombok.Setter;


@Service
public class ReplyServiceImpl implements ReplyService {

//	이 방법은 필드하 하나일때만 사용 가능 만약 2개일 경우는 
//	생성자에 @Autowired를 써줘야한다.
	@Setter(onMethod_ = @Autowired)
//	@Autowired
	private ReplyMapper mapper;


	@Override
	public List<ReplyVO> getList(Criteria criteria, Long bno) {
		return mapper.getListWithPaging(criteria, bno);
	}

	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

}