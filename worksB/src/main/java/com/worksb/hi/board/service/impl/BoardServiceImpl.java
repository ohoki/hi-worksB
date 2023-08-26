package com.worksb.hi.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.board.mapper.BoardMapper;
import com.worksb.hi.board.service.AllTaskBoardVO;
import com.worksb.hi.board.service.BoardRequestVO;
import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.ScheVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.board.service.VoteVO;
import com.worksb.hi.project.service.ProjectVO;

@Service
public class BoardServiceImpl implements BoardService {
	//이진
	
	@Autowired
	BoardMapper boardMapper;
	
	// 게시글 등록
	@Override
	public int insertBoard(BoardVO boardVO) {
		int result = boardMapper.insertBoard(boardVO);
		if(result == 1) {
			return boardVO.getPrjBoardId();
		}else {
			return -1;
		}
	}
	
	// 업무글 등록
	@Override
	public int insertTask(TaskVO taskVO) {
		int result = boardMapper.insertTask(taskVO);
		if(result == 1) {
			return taskVO.getPrjBoardId();
		}else {
			return -1;
		}
	}
	
	// 투표글 등록
	@Override
	public int insertVote(VoteVO voteVO) {
		int result = boardMapper.insertVote(voteVO);
    	// 투표 항목 등록
    	String[] listContentArr = voteVO.getListContent().split(",");
    	
    	for(int i=0; i<listContentArr.length; i++) {
    		voteVO.setListContent(listContentArr[i]);
    		boardMapper.insertVoteList(voteVO);
    	}
	
		return result;

	}
	
	//투표 항목 등록
	@Override
	public int insertVoteList(VoteVO voteVO) {
		int result = boardMapper.insertVoteList(voteVO);
		if(result == 1) {
			return voteVO.getPrjBoardId();
		}else {
			return -1;
		}
	}
	
	@Override
	public int insertSche(ScheVO scheVO) {
		int result = boardMapper.insertSche(scheVO);
		if(result == 1) {
			return scheVO.getPrjBoardId();
		}else {
			return -1;
		}
	}

	// 일정 조회
	@Override
	public ScheVO getScheInfo(ScheVO scheVO) {
		return boardMapper.getScheInfo(scheVO);
	}
	
	// 투표 조회
	@Override
	public List<VoteVO> getVoteInfo(VoteVO voteVO) {
		return boardMapper.getVoteInfo(voteVO);
	}
	
	// 투표 항목 조회
	@Override
	public List<VoteVO> getVoteList(VoteVO voteVO) {
		return boardMapper.getVoteList(voteVO);
	}
	
	// 업무 조회
	@Override
	public List<AllTaskBoardVO> getTaskInfo(AllTaskBoardVO allTaskBoardVO) {
		return boardMapper.getTaskInfo(allTaskBoardVO);
	}
	
	// 상위 업무 taskId 조회
	@Override
	public int getHighTaskId(AllTaskBoardVO allTaskBoardVO) {
		return boardMapper.getHighTaskId(allTaskBoardVO);
	}
	
	// 하위 업무 조회
	@Override
	public List<AllTaskBoardVO> getSubTask(int TaskId) {
		return boardMapper.getSubTask(TaskId);
	}

	// 업무 담당자 등록
	@Override
	public int insertTaskManager(TaskVO taskVO) {
		return boardMapper.insertTaskManager(taskVO);
	}
	
	// 업무 담당자 조회
	@Override
	public List<AllTaskBoardVO> getManager(AllTaskBoardVO allTaskBoardVO) {
		return boardMapper.getManager(allTaskBoardVO);
	}
	
	// 업무탭 리스트
	@Override
	public List<AllTaskBoardVO> getTaskList(int projectId) {
		return boardMapper.getTaskList(projectId);
	}
	
	

	

}
