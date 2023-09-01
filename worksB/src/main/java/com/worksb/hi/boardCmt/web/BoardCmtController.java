package com.worksb.hi.boardCmt.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.boardCmt.service.BoardCmtService;
import com.worksb.hi.boardCmt.service.BoardCmtVO;


@Controller
public class BoardCmtController {
	
	@Autowired
	BoardCmtService boardCmtService;
	
	// 댓글 목록
	@GetMapping("/boardCmtList")
	@ResponseBody
	public List<BoardCmtVO> boardCmtList(Model model, BoardCmtVO boardCmtVO) {
        // 댓글 가져오기
        return boardCmtService.boardCmtList(boardCmtVO);
	}
    
    // 댓글 등록
	@PostMapping("/boardCmtInsert")
	@ResponseBody
	public int boardCmtInsert(BoardCmtVO boardCmtVO) {
		return boardCmtService.boardCmtInsert(boardCmtVO);
	}
	
	// 댓글 수정
	@PostMapping("boardCmtUpdate")
	@ResponseBody
	public int boardCmtUpdate(BoardCmtVO boardCmtVO) {
		return boardCmtService.boardCmtUpdate(boardCmtVO);
	}
}