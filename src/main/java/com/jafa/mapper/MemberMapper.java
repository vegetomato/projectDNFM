package com.jafa.mapper;

import java.util.List;

import com.jafa.model.Criteria;
import com.jafa.model.Member;

public interface MemberMapper {
// 가입, 수정, 리스트 
	List<Member> getList(Criteria criteria);
	void insert(Member member);
	void update(Member member);
	Member get(Long id);
	int totalCount(Criteria criteria);
}
