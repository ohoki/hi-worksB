package com.worksb.hi.boardCmt.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardCmtService {
	
	public List<BoardCmtVO> boardCmtList(BoardCmtVO boardCmtVO);
    
}
