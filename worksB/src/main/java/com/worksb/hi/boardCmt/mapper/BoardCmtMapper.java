package com.worksb.hi.boardCmt.mapper;

import java.util.List;

import com.worksb.hi.boardCmt.service.BoardCmtVO;

public interface BoardCmtMapper {
	
	// 댓글 조회
	public List<BoardCmtVO> boardCmtList();
	
	// 대댓글 조회
	/* public List<BoardCmtVO> boardCmtchildList(BoardCmtVO boardCmtVO); */
	
	
}
