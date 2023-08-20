package com.worksb.hi.project.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.project.mapper.ProjectMapper;
import com.worksb.hi.project.service.PrjParticirVO;
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
		//프로젝트 등록
		int result = projectMapper.insertProject(projectVO);
		
		//참여자 등록
		PrjParticirVO particirVO = new PrjParticirVO();
		particirVO.setProjectId(projectVO.getProjectId());
		particirVO.setMemberId(projectVO.getMemberId());
		particirVO.setManager("A2");
		
		
		return result;
	}


	@Override
	public int updateProject(ProjectVO projectVO) {
		int result = projectMapper.updateProject(projectVO);
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
	@Override
	public List<ProjectVO> searchPrj(String memberId) {
		List<ProjectVO> vo=projectMapper.searchPrj(memberId);
		//projectName으로부터 부서는 분리하고 출력
//		for(int i = 0; i < vo.size(); i++) {
//			String[] prjNames=vo.get(i).getProjectName().split("/");
//			vo.get(i).setProjectName(prjNames[1]);
//		}
		return vo;
	}


	@Override
	public List<ProjectVO> selectFromCompany(int companyId,String memberId) {
		List<ProjectVO> vo=projectMapper.selectFromCompany(companyId);
		List<ProjectVO> result = new ArrayList<>();

		Set<Integer> uniqueProjectIds = new HashSet<>();
		Set<Integer> sessionMatchingProjectIds = new HashSet<>();

		for(int i=vo.size()-1;i >= 0;i--){
		    ProjectVO project = vo.get(i);

		    // project_id가 중복되지 않으면 결과 리스트에 추가하고, 중복된 id는 uniqueProjectIds에 추가
		    if (!uniqueProjectIds.contains(project.getProjectId())) {
		        uniqueProjectIds.add(project.getProjectId());

		        // 세션의 id와 member_id가 일치하는 경우 해당 프로젝트의 project_id를 sessionMatchingProjectIds에 추가
		        if (memberId.equals(project.getMemberId())) {
		            sessionMatchingProjectIds.add(project.getProjectId());
		        }
		    }
		}

		// 결과 리스트에 중복된 프로젝트 중 세션과 일치하는 것만 추가
		for(ProjectVO project:vo) {
		    if (uniqueProjectIds.contains(project.getProjectId())) {
		        result.add(project);
		        uniqueProjectIds.remove(project.getProjectId()); // 중복 제거한 프로젝트는 세트에서 제거
		    }
		}

		// 결과 출력
		for(ProjectVO project:result){
		    System.out.println(project.getProjectName());
		}
		return result;
	}


	@Override
	public void updateStar(ProjectVO vo) {
		projectMapper.updateStar(vo);
	}








}
