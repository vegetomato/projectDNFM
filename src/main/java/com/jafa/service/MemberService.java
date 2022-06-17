package com.jafa.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jafa.model.Criteria;
import com.jafa.model.Member;

public interface MemberService {
	List<Member> getList(Criteria criteria);
	Member get(Long id);
	void register(Member member);
	void modify(Member member);
	void remove(Long id);
	int totalCount(Criteria criteria);
	
	String loginCheck(Member member);
	void logout();
}
