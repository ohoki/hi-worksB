package com.worksb.hi.project.service;

import java.util.List;

public interface ProjectService {
	//이진
	public int insertProject(ProjectVO projectVO);
	public int updateProject(ProjectVO projectVO);
	public ProjectVO getProjectInfo(int projectId);
	
	public int deleteProject(int projectId);
	
	
	
	
	
	
	
	
	//주현
	public List<ProjectVO> searchPrj(Integer companyId);
}
