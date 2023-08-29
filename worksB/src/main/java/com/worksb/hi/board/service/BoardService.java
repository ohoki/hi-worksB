package com.worksb.hi.board.service;

import java.util.List;

import com.worksb.hi.project.service.ProjectVO;

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
	// 업무 조회
	public List<AllTaskBoardVO> getTaskInfo(AllTaskBoardVO allTaskBoardVO);
	// 상위 업무 taskId 조회
	public int getHighTaskId(AllTaskBoardVO allTaskBoardVO);
	// 업무 담당자 조회
	public List<AllTaskBoardVO> getManager(AllTaskBoardVO allTaskBoardVO);
	// 하위 업무 조회
	public List<AllTaskBoardVO> getSubTask(int TaskId);
	
	// 업무 담당자 등록
	public int insertTaskManager(TaskVO taskVO);
	
	// 업무탭 리스트
	public List<AllTaskBoardVO> getTaskList(int projectId);
	
	// 업무 수정
	public int updateTask(TaskVO taskVO);
	public int updateBoard(BoardVO boardVO);
	public int updateTaskManager(TaskVO taskVO);
	
	
	//정현
	//프로젝트 일정 캘린더 조회
	public List<ScheVO> getScheCalendar(int projectId);
	//프로젝트 업무 캘린더 조회
	public List<TaskVO> getTaskCalendar(int projectId);
	//프로젝트 일정 상세 조회
	public BoardVO getScheBoardInfo(int prjBoardId);
}
