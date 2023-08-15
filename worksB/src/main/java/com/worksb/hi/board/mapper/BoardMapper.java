package com.worksb.hi.board.mapper;

import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.TaskVO;

public interface BoardMapper {
	// 이진
	public int insertBoard(BoardVO boardVO);
	
	public int insertTask(TaskVO taskVO);
}
