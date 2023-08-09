package com.worksb.hi.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.project.mapper.ProjectMapper;
import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	ProjectMapper projectMapper;
	
	@Override
	public int insertProject(ProjectVO projectVO) {
		int result = projectMapper.insertProject(projectVO);
		if(result == 1) {
			return projectVO.getProjectId();
		}else {
			return -1 ;
		}
	}

}
