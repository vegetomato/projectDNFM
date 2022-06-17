package com.jafa.mapper;

import static org.junit.Assert.*;

import javax.servlet.http.HttpSession;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.jafa.config.RootConfig;
import com.jafa.config.ServletConfig;
import com.jafa.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class,ServletConfig.class})
@WebAppConfiguration
public class MemberMapperTest {

	@Autowired
	MemberMapper mapper; 
	
	@Test
	public void loginCheckTest() {
		Member member = new Member(); 
		member.setEmail("ka@naver.com");
		member.setPassword("kkkk1111!");
		String memberEmail = mapper.loginCheck(member);
		assertEquals(memberEmail, member.getEmail());
		
		
		member.setEmail("ka111111@naver.com");
		member.setPassword("kkkk1111!");
		String memberEmail2 = mapper.loginCheck(member);
		assertNull(memberEmail2);
		
		
		member.setEmail("ka@naver.com");
		member.setPassword("kkkk1111");
		String memberEmail3 = mapper.loginCheck(member);
		assertNull(memberEmail3);
	}
	
	@Autowired
	HttpSession session;
	
	
	@Test
	public void test212() {
		assertNotNull(session);
	}
}
