package com.worksb.hi.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.project.mapper.ProjectMapper;
import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	//이진
	ProjectMapper projectMapper;
	
	
	//주현
	
	
	
	//이진
	@Override
	public int insertProject(ProjectVO projectVO) {
		int result = projectMapper.insertProject(projectVO);
		if(result == 1) {
			return projectVO.getProjectId();
		}else {
			return -1 ;
		}
	}


	@Override
	public int updateProject(ProjectVO projectVO) {
		int result = projectMapper.insertProject(projectVO);
		if(result == 1) {
			return projectVO.getProjectId();
		}else {
			return -1 ;
		}
	}


	@Override
	public ProjectVO getProjectInfo(int projectId) {
		
		return projectMapper.getProjectInfo(projectId);
	}


	@Override
	public int deleteProject(int projectId) {
		int result = projectMapper.deleteProject(projectId);
		if(result == 1) {
			return projectId;
		}else {
			return -1;
		}
	}


	
	
	
	
	
	
	
	
	//주현

}
