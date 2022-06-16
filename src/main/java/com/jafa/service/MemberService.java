package com.jafa.service;

import java.util.List;

import com.jafa.model.Criteria;
import com.jafa.model.Member;

public interface MemberService {
	List<Member> getList(Criteria criteria);
	void register(Member member);
	void modify(Member member);
	Member get(Long id);
	int totalCount(Criteria criteria);
}
