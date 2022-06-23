package com.jafa.service;

import java.util.List;

import com.jafa.model.Criteria;
import com.jafa.model.ReplyVO;

public interface ReplyService {
	List<ReplyVO> getList(Criteria criteria, Long bno);
	int register(ReplyVO vo);
	ReplyVO get(Long rno);
	int remove(Long rno);
	int modify(ReplyVO vo);
}
