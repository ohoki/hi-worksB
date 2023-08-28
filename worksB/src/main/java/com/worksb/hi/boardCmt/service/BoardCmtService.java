package com.worksb.hi.boardCmt.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardCmtService {
	
	// 댓글 리스트
	public List<BoardCmtVO> getBoardCmtList();
}
