package com.jafa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.model.Criteria;
import com.jafa.model.Member;
import com.jafa.model.PageMaker;
import com.jafa.service.MemberServiceImpl;
import com.jafa.validation.MemberValidator;

@RequestMapping("/member/")
@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;

	@GetMapping("/list")
	public String getMemberList(Model model, Criteria criteria) {
		PageMaker pageMaker = new PageMaker(criteria, service.totalCount(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		List<Member> list = service.getList(criteria);
		model.addAttribute("list",list);
		return "member/list";
	}
	
	@GetMapping("/register")
	public String registerForm(Member member, Model model) {
		model.addAttribute("member",member);
		return "member/register";
	}

	@PostMapping("/register")
	public String register(@Valid Member member, Errors errors) {
//		new MemberValidator().validate(member, errors);
		if(errors.hasErrors()) {
			return "member/register";
		}
		service.register(member);
		return "redirect:list";
	}
	
	@GetMapping("/modify")
	public String updateForm(Long id, Model model) {
		model.addAttribute("member",service.get(id));
		return "member/modify";
	}
	
	@PostMapping("/modify")
	public String update(Member member) {
		service.modify(member);
		return "redirect:list";
	}
	@GetMapping("/get")
	public String get(Long id, Model model) {
		model.addAttribute("member",service.get(id));
		return "member/get";
	}
	
	@PostMapping("/remove")
	public String delete(Long id) {
		service.remove(id);
		return "redirect:list";
	}
	
	@GetMapping("/login")
	public String loginForm(Member member) {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(@Valid Member member, Errors errors, Model model) {
		String email = service.loginCheck(member);
		new MemberValidator().validate(member, errors);
		if(email == null) {
			model.addAttribute("message", "로그인 실패");
			return "member/login";
		} 
		return "redirect:/";
	}
	@GetMapping("/logout")
	public String logoutForm() {
		return "member/logout";
	}
	
	@PostMapping("/logout")
	public String logout(Model model) {
		service.logout();
		return "redirect:/";
	}
}
