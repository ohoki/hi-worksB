package com.worksb.hi.board.service;

import java.util.List;

import lombok.Data;
@Data
public class BoardRequestVO {
	BoardVO boardVO;
	TaskVO taskVO;
	ScheVO scheVO;
	
	List<TaskVO> subTask;
	List<TaskVO> prjManager;
	List<TaskVO> subManager;
	List<TaskVO> deleteSubtask;
	//VoteVO voteVO, ScheVO scheVO
	
	String memberName;
	String realProfilePath;
}
