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
	
	// 부모면 '삭제된 댓글입니다' 만 띄우는 용도
	@PostMapping("boardCmtDelete")
	@ResponseBody
	public int boardCmtDelete(BoardCmtVO boardCmtVO) {
		return boardCmtService.boardCmtDelete(boardCmtVO);
	}
	
	// 부모가 아니고 댓글없는 부모의 경우 삭제 처리하기위함
	@PostMapping("realCmtDelete")
	@ResponseBody
	public int realCmtDelete(BoardCmtVO boardCmtVO) {
		return boardCmtService.realCmtDelete(boardCmtVO);
	}
	
	// 
}