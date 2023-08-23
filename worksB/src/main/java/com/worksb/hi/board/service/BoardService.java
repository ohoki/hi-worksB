package com.worksb.hi.board.service;

import java.util.List;

public interface BoardService {
	// 이진
	// 게시글 등록
	public int insertBoard(BoardVO boardVO);
	// 업무글 등록 - 상위, 하위
	public int insertTask(TaskVO taskVO);
	// 투표글 등록
	public int insertVote(VoteVO voteVO);
	// 투표 항목 등록
	public int insertVoteList(VoteVO voteVO);
	// 일정글 등록
	public int insertSche(ScheVO scheVO);
	
	// 일정 조회
	public ScheVO getScheInfo(ScheVO scheVO);
	// 투표 조회
	public List<VoteVO> getVoteInfo(VoteVO voteVO);
	// 투표 항목 조회
	public List<VoteVO> getVoteList(VoteVO voteVO);
	// 상위 업무 조회
	public List<TaskVO> getHighTask(TaskVO taskVO);
	// 상위 업무 taskId 조회
	public int getHighTaskId(TaskVO taskVO);
	// 상위 업무 담당자 조회
	public List<TaskVO> getHighManager(TaskVO taskVO);
	// 하위 업무 조회
	public List<TaskVO> getSubTask(int TaskId);
	
	// 업무 담당자 등록
	public int insertTaskManager(TaskVO taskVO);
	
	
	
	
}
