package com.worksb.hi.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.project.mapper.ProjectMapper;
import com.worksb.hi.project.service.DeptVO;
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
	// 프로젝트 등록
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

	// 프로젝트 수정
	@Override
	public int updateProject(ProjectVO projectVO) {
		int result = projectMapper.updateProject(projectVO);
		if(result == 1) {
			return projectVO.getProjectId();
		}else {
			return -1 ;
		}
	}

	// 프로젝트 정보조회 - 수정폼에 불러오기
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
	
	// 부서 정보 - 회사 번호 기준
	@Override
	public List<DeptVO> getDeptInfo(int companyId) {
		return projectMapper.getDeptInfo(companyId);
	}
	
	// 부서 정보 - 부서 번호 기준
	@Override
	public DeptVO getDeptInfoByDeptId(int deptId) {
		return projectMapper.getDeptInfoByDeptId(deptId);
	}
	
	// 프로젝트 참여자 등록
	@Override
	public int insertParticipant(PrjParticirVO participant) {
		return projectMapper.insertParticipant(participant);
	}


	
	
	
	
	
	
	
	
	//주현
	@Override
	public List<ProjectVO> searchPrj(String memberId) {
		List<ProjectVO> vo=projectMapper.searchPrj(memberId);
		return vo;
	}


	@Override
	public List<ProjectVO> selectFromCompany(int companyId) {
		List<ProjectVO> vo=projectMapper.selectFromCompany(companyId);
		return vo;
	}


	@Override
	public void updateStar(ProjectVO vo) {
		projectMapper.updateStar(vo);
	}
















}
