package com.worksb.hi.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.board.mapper.BoardMapper;
import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.board.service.VoteVO;

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

	@Override
	public int insertTask(TaskVO taskVO) {
		int result = boardMapper.insertTask(taskVO);
		if(result == 1) {
			return taskVO.getPrjBoardId();
		}else {
			return -1;
		}
	}

	@Override
	public int insertVote(VoteVO voteVO) {
		int result = boardMapper.insertVote(voteVO);
		if(result == 1) {
			return voteVO.getPrjBoardId();
		}else {
			return -1;
		}
	}

	@Override
	public int insertVoteList(VoteVO voteVO) {
		int result = boardMapper.insertVoteList(voteVO);
		if(result == 1) {
			return voteVO.getPrjBoardId();
		}else {
			return -1;
		}
	}

}
