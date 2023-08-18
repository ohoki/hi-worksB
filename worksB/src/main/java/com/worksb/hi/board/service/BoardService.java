package com.worksb.hi.board.service;

public interface BoardService {
	// 이진
	public int insertBoard(BoardVO boardVO);
	
	public int insertTask(TaskVO taskVO);
	
	public int insertVote(VoteVO voteVO);
	public int insertVoteList(VoteVO voteVO);
	
	public int insertSche(ScheVO scheVO);
	
	
	
	
	
}
