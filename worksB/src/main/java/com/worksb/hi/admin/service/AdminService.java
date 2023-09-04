package com.worksb.hi.admin.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;
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
	
	// 회사 정보 수정
	public int updateCompany(CompanyVO companyVO);
	
	public List<MemberVO> CompanyMemberList(int companyId);
}
