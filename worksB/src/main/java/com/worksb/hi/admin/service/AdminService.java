package com.worksb.hi.admin.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.company.service.DepartmentVO;
import com.worksb.hi.company.service.JobVO;
import com.worksb.hi.project.service.FileDataVO;
import com.worksb.hi.project.service.ProjectVO;

public interface AdminService {
	//downloadList
	public List<FileDataVO> downloadList(int companyId,PagingVO pagingVO);
	//downloadlist의 갯수
	public int downloadCount(int companyId);
	
	//prjlist갯수
	public int prjcount(int companyId);
	//projectlist
	public List<ProjectVO>projectList(int companyId,PagingVO pagingVO);

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
	
	//직급insert
	public int insertRole(JobVO vo);
	//업데이트된 직급 받아오기
	//직급삭제
	public int deleteRole(int jobId);
	//직급업데이트
	public int updateRole(JobVO vo);
}
