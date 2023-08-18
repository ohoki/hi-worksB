package com.worksb.hi.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.project.service.ProjectVO;

public interface ProjectMapper {
	//이진
	public int insertProject(ProjectVO projectVO);
	public int updateProject(ProjectVO projectVO);
	public ProjectVO getProjectInfo(int projectId);
	
	public int deleteProject(int projectId);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//주현
	public List<ProjectVO> searchPrj(String memberId);
	public List<ProjectVO> selectFromCompany(int companyId);
	public void updateStar(ProjectVO vo);
}
