package com.worksb.hi.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;


@Controller
public class BoardController {
	//이진
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/boardInsert")
	public String BoardInsertForm() {
		return "board/boardInsert";
	}
	
	@PostMapping("/boardInsert")
	public String boardInsertProcess(BoardVO boardVO) {
		
		
		boardService.insertBoard(boardVO);
		return "redirect:boardList"; 
	}
	
	
}
