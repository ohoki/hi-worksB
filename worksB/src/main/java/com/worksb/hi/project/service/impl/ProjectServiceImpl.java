package com.worksb.hi.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.project.mapper.ProjectMapper;
import com.worksb.hi.project.service.DeptVO;
import com.worksb.hi.project.service.PrjParticirVO;
import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;
import com.worksb.hi.project.service.FileDataVO;

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
	
	//프로젝트 게시글 리스트
	public List<BoardVO> getBoardList(ProjectVO projectVO) {
		return projectMapper.getBoardList(projectVO);
	}
	
	//프로젝트 고정 게시글 리스트
	public List<BoardVO> getPinBoardList(ProjectVO projectVO) {
		return projectMapper.getPinBoardList(projectVO);
	};
	
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
	// 프로젝트 참여자 조회
	@Override
	public List<PrjParticirVO> getParticirList(int projectId) {
		return projectMapper.getParticirList(projectId);
	}
	//프로젝트 즐겨찾기 여부
	public PrjParticirVO getParticirByProject(PrjParticirVO particirVO) {
		return projectMapper.getParticirByProject(particirVO);
	}
	//프로젝트 참여 승인 조회
	@Override
	public List<PrjParticirVO> getCheckAccp(PrjParticirVO participant) {
		return projectMapper.getCheckAccp(participant);
	}
	//프로젝트 참여 승인하기update
	@Override
	public int updateParticir(PrjParticirVO participant) {
		return projectMapper.updateParticir(participant);
	}
	

	



	
	
	//주현

	// 개별조회
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
	
	//북마크여부(NO)+만료여부에 따른 조회
	@Override
	public List<ProjectVO> searchPrjCls(String memberId, String cls) {
		return projectMapper.searchPrjCls(memberId, cls);
	}


	//회사별조회
	@Override
	public List<ProjectVO> selectFromCompany(ProjectVO vo) {
		List<ProjectVO> list=projectMapper.selectFromCompany(vo);
		return list;
	}

	//로그인된 아이디가 참여하고 있는 프로젝트 
	@Override
	public List<PrjParticirVO> selectAllparticier(String memberId){
		return projectMapper.selectAllparticier(memberId);
	}

	//즐겨찾기갱신
	@Override
	public void updateStar(ProjectVO vo) {
		projectMapper.updateStar(vo);
	}

	//갯수세기(전체공개_
	@Override
	public int countWhenPublic(ProjectVO vo,SearchVO searchvo) {
		return projectMapper.countWhenPublic(vo,searchvo);
	}
	//갯수세기(작성자의글만
	@Override
	public int countWhenWriter(ProjectVO vo, SearchVO searchvo) {
		return projectMapper.countWhenWriter(vo, searchvo);
	}
	
	//파일탭(전체 글)
	@Override
	public List<FileDataVO> viewFileWhenPublic(ProjectVO vo,PagingVO pagingVO,SearchVO searchVO) {
		return projectMapper.viewFileWhenPublic(vo,pagingVO,searchVO);
	}
	//관리자여부
	@Override
	public String managerOrNot(ProjectVO vo) {
		return projectMapper.managerOrNot(vo);
	}
	
	//파일탭(작성자의 글만)
	@Override
	public List<FileDataVO> viewFileWhenRestricted(ProjectVO vo,PagingVO pagingVO,SearchVO searchVO) {
		return projectMapper.viewFileWhenRestricted(vo,pagingVO,searchVO);
	}

	//fileUpload
	@Override
	public int insertFile(FileDataVO vo) {
		return projectMapper.insertFile(vo);
	}
	//fileDownload
	@Override
	public FileDataVO getFileById(int fileId) {
		return projectMapper.getFileById(fileId);
	}

	@Override
	public PrjParticirVO getMarkupInfo(int projectId, String memberId) {
		return projectMapper.getMarkupInfo(projectId, memberId);
	}

	@Override
	public int updateFile(FileDataVO vo) {
		return projectMapper.updateFile(vo);
	}

	

	
	



	
















}
