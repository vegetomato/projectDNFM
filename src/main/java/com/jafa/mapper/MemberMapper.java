package com.jafa.mapper;

import java.util.List;


import com.jafa.model.Criteria;
import com.jafa.model.Member;

public interface MemberMapper {
// 가입, 수정, 리스트 
	List<Member> getList(Criteria criteria);
	Member get(Long id);
	void insert(Member member);
	void update(Member member);
	void delete(Long id);
	int totalCount(Criteria criteria);
	String loginCheck(Member member);
}
