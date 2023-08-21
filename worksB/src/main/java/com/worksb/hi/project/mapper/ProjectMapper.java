package com.worksb.hi.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.project.service.DeptVO;
import com.worksb.hi.project.service.PrjParticirVO;
import com.worksb.hi.project.service.ProjectVO;

public interface ProjectMapper {
	//이진
	// 프로젝트 등록
	public int insertProject(ProjectVO projectVO);
	// 프로젝트 수정
	public int updateProject(ProjectVO projectVO);
	// 프로젝트 정보조회 - 수정폼에 불러오기
	public ProjectVO getProjectInfo(int projectId);
	
	public int deleteProject(int projectId);
	
	// 부서 정보 - 회사 번호 기준
	public List<DeptVO> getDeptInfo(int companyId);
	// 부서 정보 - 부서 번호 기준
	public DeptVO getDeptInfoByDeptId(int deptId);
	
	// 프로젝트 참여자 등록
	public int insertParticipant(PrjParticirVO participant);

  
  
  
  
  
  
  
  
  
  
	//주현
	public List<ProjectVO> searchPrj(String memberId);
	public List<ProjectVO> selectFromCompany(int companyId);
	public void updateStar(ProjectVO vo);
}
