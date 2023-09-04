package com.worksb.hi.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.company.service.DepartmentVO;
import com.worksb.hi.company.service.JobVO;
import com.worksb.hi.project.service.FileDataVO;
import com.worksb.hi.project.service.ProjectVO;

public interface AdminMapper {
	
	
	//downloadList
	public List<FileDataVO> downloadList(@Param("companyId")int companyId,@Param("pagingvo")PagingVO pagingVO);
	//downloadlist의 갯수
	public int downloadCount(int companyId);
	
	//prjlist갯수
	public int prjcount(int companyId);
	//projectlist
	public List<ProjectVO>projectList(@Param("companyId")int companyId,@Param("pagingvo")PagingVO pagingVO);
	
	// 회사 정보 수정
	public int updateCompany(CompanyVO companyVO);
	// 회사 구성원 리스트
	public List<MemberVO> companyMemberList(int companyId);
	// 회원 정보 수정
	public String companyMemberInfo(MemberVO memberVO);
	
	//부서목록
	public List<DepartmentVO>departmentList(int companyId);
  
	//직급목록
	public List<JobVO>jobList(int companyId);
	
	//부서insert
	public int insertDept(DepartmentVO vo);
	//업데이트된 부서 받아오기
	public DepartmentVO getNewestDep();
	//부서삭제
	public int deleteDept(int deptId);
	//부서업데이트
	public int updateDept(DepartmentVO vo);
	//해당 부서번호에 해당하는 프로젝트의 이름 불러오이
	public List<ProjectVO>getPrjName(int deptId);
	//해당 부서번호에 해당하는 프로젝트아이디를 불러오기
	public List<ProjectVO>getPrjId(int deptId);
	
	//직급insert
	public int insertRole(JobVO vo);
	//업데이트된 직급 받아오기
	//직급삭제
	public int deleteRole(int jobId);
	//직급업데이트
	public int updateRole(JobVO vo);
}
