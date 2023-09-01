package com.worksb.hi.boardCmt.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardCmtService {
	
	// 댓글 대댓글 조회
	public List<BoardCmtVO> boardCmtList(BoardCmtVO boardCmtVO);
    
	// 댓글 등록
	public int boardCmtInsert(BoardCmtVO boardCmtVO);
	
	// 댓글 수정
	public int boardCmtUpdate(BoardCmtVO boardCmtVO);
}