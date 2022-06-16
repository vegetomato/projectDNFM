package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.model.Board;
import com.jafa.model.Criteria;
import com.jafa.model.PageMaker;
import com.jafa.service.BoardServiceImpl;
import com.jafa.validation.BoardValidator;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardServiceImpl service;
	
	@GetMapping("/list")
	public String list(Model model, Criteria criteria) {
		PageMaker pageMaker = new PageMaker(criteria, service.totalCount(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		List<Board> list = service.getList(criteria);
		model.addAttribute("list",list);
		return "board/list";
	}
	@GetMapping("/get")
	public String get(Model model, Long bno) {
		model.addAttribute("board", service.get(bno));
		return "board/get";
	}
	@PostMapping("/remove")
	public String delete(Long bno) {
		service.remove(bno);
		return "redirect:list";
	}
	
	@GetMapping("/modify")
	public String updateForm(Model model, Long bno){
		model.addAttribute("board", service.get(bno));
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String update(Board board) {
		service.modify(board);
		return "redirect:list";
	}
	
	@GetMapping("/register")
	public String registerForm(Board board, Model model) {
		model.addAttribute("board",board);
		return "board/register";
	}
	@PostMapping("/register")
	public String register(Board board, Errors errors) {
		new BoardValidator().validate(board, errors);
		if(errors.hasErrors()) {
			return "board/register";
		}
		service.register(board);
		return "redirect:list";
		
	}
}
