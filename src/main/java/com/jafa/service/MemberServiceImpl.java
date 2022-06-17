package com.jafa.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.mapper.MemberMapper;
import com.jafa.model.Criteria;
import com.jafa.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	HttpSession session;
	
	@Override
	public List<Member> getList(Criteria criteria) {
		return mapper.getList(criteria);
	}

	@Override
	public void register(Member member) {
		mapper.insert(member);
	}

	@Override
	public void modify(Member member) {
		mapper.update(member);
	}

	@Override
	public Member get(Long id) {
		return mapper.get(id);
	}

	@Override
	public int totalCount(Criteria criteria) {
		return mapper.totalCount(criteria);
	}

	@Override
	public void remove(Long id) {
		mapper.delete(id);
		
	}

	@Override
	public String loginCheck(Member member) {
		String email = mapper.loginCheck(member);
		if(email != null) {
			session.setAttribute("email", email);
		}
		return email;
	}

	@Override
	public void logout() {
		session.invalidate();
	}
	
}
