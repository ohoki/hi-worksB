package com.worksb.hi.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.board.mapper.BoardMapper;
import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	//이진
	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public int insertBoard(BoardVO boardVO) {
		int result = boardMapper.insertBoard(boardVO);
		if(result == 1) {
			return boardVO.getPrjBoardId();
		}else {
			return -1;
		}
	}

}
