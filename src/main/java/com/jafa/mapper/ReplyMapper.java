package com.jafa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.model.Criteria;
import com.jafa.model.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> getListAll();
	List<ReplyVO> getListWithPaging(@Param("cir")Criteria criteria, @Param("bno")Long bno);
//	파라미터가 2개 이상이면 @Param을 해준다.
	int insert(ReplyVO vo);
	ReplyVO read(Long rno);
	int delete(Long rno);
	int update(ReplyVO vo);
}
