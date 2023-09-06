package com.worksb.hi.projectCmt.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ProjectCmtService {
	// 댓글 전체
	public List<ProjectCmtVO> projectCmtList(ProjectCmtVO projectCmtVO);
	
	// 댓글 등록
	public int insertProjectCmt(ProjectCmtVO projectCmtVO);
	
	// 댓글 수정
	public int updateProjectCmt(ProjectCmtVO projectCmtVO);
	
	// 댓글 개별 삭제
	public int deleteProjectCmt(ProjectCmtVO projectCmtVO);
	
	// 게시글 댓글 전체삭제
	public int deleteProjectCmtByBoard(ProjectCmtVO projectCmtVO);
	
	// 댓글 조회
	public ProjectCmtVO projectCmtInfo(ProjectCmtVO projectCmtVO);
}
