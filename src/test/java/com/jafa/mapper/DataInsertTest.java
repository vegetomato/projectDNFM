package com.jafa.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.model.Member;

public class DataInsertTest extends Apptest{

	@Autowired
	MemberMapper mapper;
	
	@Test
	public void dataInsertTest() {
		for(int i = 0; i<=100 ; i++) {
			Member member = new Member();
			member.setUserName("손오공"+i);
			member.setEmail("son@naver.com"+i);
			member.setPassword("aaaa"+i+"!");
			mapper.insert(member);
			
		}
	}
}
