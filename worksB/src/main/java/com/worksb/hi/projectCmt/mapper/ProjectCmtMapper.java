package com.worksb.hi.projectCmt.mapper;

import java.util.List;

import com.worksb.hi.projectCmt.service.ProjectCmtVO;

public interface ProjectCmtMapper {
	// 댓글 전체
	public List<ProjectCmtVO> projectCmtList(ProjectCmtVO projectCmtVO);
	
	// 댓글 등록
	public int insertProjectCmt(ProjectCmtVO projectCmtVO);
	
	// 댓글 수정
	public int updateProjectCmt(ProjectCmtVO projectCmtVO);
	
	// 댓글 삭제
	public int deleteProjectCmt(ProjectCmtVO projectCmtVO);
	
	// 댓글 조회
	public ProjectCmtVO projectCmtInfo(ProjectCmtVO projectCmtVO);
}
