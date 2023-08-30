package com.worksb.hi.boardCmt.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.boardCmt.mapper.BoardCmtMapper;
import com.worksb.hi.boardCmt.service.BoardCmtService;
import com.worksb.hi.boardCmt.service.BoardCmtVO;


@Service
public class BoardCmtServiceImpl implements BoardCmtService {

	@Autowired
	BoardCmtMapper boardCmtMapper; 
	
	@Override
	public List<BoardCmtVO> boardCmtList() {
		return boardCmtMapper.boardCmtList();
	}


	

}
