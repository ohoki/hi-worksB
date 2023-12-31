package com.worksb.hi.projectCmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.projectCmt.mapper.ProjectCmtMapper;
import com.worksb.hi.projectCmt.service.ProjectCmtService;
import com.worksb.hi.projectCmt.service.ProjectCmtVO;

@Service
public class ProjectCmtServiceImpl implements ProjectCmtService {

	@Autowired
	ProjectCmtMapper projectCmtMapper;
	
	// 댓글 전체 조회
	@Override
	public List<ProjectCmtVO> projectCmtList(ProjectCmtVO projectCmtVO) {
		return projectCmtMapper.projectCmtList(projectCmtVO);
	}
	
	// 댓글 등록
	@Override
	public int insertProjectCmt(ProjectCmtVO projectCmtVO) {
		return projectCmtMapper.insertProjectCmt(projectCmtVO);
	}

	// 댓글 수정
	@Override
	public int updateProjectCmt(ProjectCmtVO projectCmtVO) {
		return projectCmtMapper.updateProjectCmt(projectCmtVO);
	}

	// 댓글 삭제
	@Override
	public int deleteProjectCmt(ProjectCmtVO projectCmtVO) {
		return projectCmtMapper.deleteProjectCmt(projectCmtVO);
	}
	
	// 댓글 조회
	@Override
	public ProjectCmtVO projectCmtInfo(ProjectCmtVO projectCmtVO) {
		return projectCmtMapper.projectCmtInfo(projectCmtVO);
	}
	
	// 게시글 댓글 전체삭제
	@Override
	public int deleteProjectCmtByBoard(ProjectCmtVO projectCmtVO) {
		return projectCmtMapper.deleteProjectCmtByBoard(projectCmtVO);
	}

}
