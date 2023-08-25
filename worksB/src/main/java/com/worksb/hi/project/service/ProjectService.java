package com.worksb.hi.project.service;

import java.util.List;

import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.common.SearchVO;

public interface ProjectService {
	//이진
	// 프로젝트 등록
	public int insertProject(ProjectVO projectVO);
	// 프로젝트 수정
	public int updateProject(ProjectVO projectVO);
	// 프로젝트 정보조회 - 수정폼에 불러오기
	public ProjectVO getProjectInfo(int projectId);
	
	public int deleteProject(int projectId);
	
	//프로젝트 게시글 리스트
	public List<BoardVO> getBoardList(ProjectVO projectVO);
	
	// 부서 정보 - 회사 번호 기준
	public List<DeptVO> getDeptInfo(int companyId);
	// 부서 정보 - 부서 번호 기준
	public DeptVO getDeptInfoByDeptId(int deptId);
	
	// 프로젝트 참여자 등록
	public int insertParticipant(PrjParticirVO participant);
	// 프로젝트 참여자 조회
	public List<PrjParticirVO> getParticirList(int projectId);
	//프로젝트 즐겨찾기 여부
	public PrjParticirVO getParticirByProject(PrjParticirVO particirVO);
	
	
	
	
	
//주현
	//내가 참여하는 프로젝트 보기
	public List<ProjectVO> searchPrj(String memberId);
	//내가 참여하는 프로젝트 중 즐겨찾기가 안 된 것의 만료여부
	public List<ProjectVO> searchPrjCls(String memberId, String cls);
	//내 회사의 프로젝트 전체 보기
	public List<ProjectVO> selectFromCompany(ProjectVO vo);
	
	//즐찾갱신
	public void updateStar(ProjectVO vo);
	
	//로그인된 아이디가 참여하고 있는 프로젝트를 출력
	public List<PrjParticirVO> selectAllparticier(String memberId);
	
	//파일탭(전체공개프로젝트)
	public List<FileDataVO> viewFileWhenPublic(ProjectVO vo);
	//관리자여부
	public String managerOrNot(ProjectVO vo);
	//파일탭(파일접근제한프로젝트+로그인한 아이디가 관리자인 경우)
	public List<FileDataVO>viewFileWhenRestricted1(ProjectVO vo);
	//파일탭(파일접근제한프로젝트+로그인한 아이디가 관리자가 아닌 경우)
	public List<FileDataVO>viewFileWhenRestricted2(ProjectVO vo);

}
