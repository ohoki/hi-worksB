package com.worksb.hi.board.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;


@Controller
public class BoardController {
	//이진
	
	@Autowired
	BoardService boardService;
	
	// 게시글 등록폼
	// 회원번호, 프로젝트번호
	@GetMapping("/boardInsert")
	public String BoardInsertForm(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		
		model.addAttribute("memberId", memberId);
		return "project/boardInsert";
	}
	
	//게시글 등록
	@PostMapping("/boardInsert")
	public String boardInsertProcess(BoardVO boardVO, HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
        boardVO.setMemberId(memberId);
		
		boardService.insertBoard(boardVO);
		return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
	}
	
	
}
