package com.worksb.hi.boardCmt.mapper;

import java.util.List;

import com.worksb.hi.boardCmt.service.BoardCmtVO;

public interface BoardCmtMapper {
	
	// 댓글 조회
	public List<BoardCmtVO> boardCmtList(BoardCmtVO boardCmtVO);
	
	// 댓글 등록
	public int boardCmtInsert(BoardCmtVO boardCmtVO);
	
	// 댓글 수정
	public int boardCmtUpdate(BoardCmtVO boardCmtVO);
	
	// 댓글 삭제
	public int boardCmtDelete(BoardCmtVO boardCmtVO);
	
	// 진짜 댓글 삭제
	public int realCmtDelete(BoardCmtVO boardCmtVO);
}