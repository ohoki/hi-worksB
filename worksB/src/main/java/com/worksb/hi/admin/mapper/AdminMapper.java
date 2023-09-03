package com.worksb.hi.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.project.service.FileDataVO;
import com.worksb.hi.project.service.ProjectVO;

public interface AdminMapper {
	//downloadList
	public List<FileDataVO> downloadList(@Param("companyId")int companyId,@Param("pagingvo")PagingVO pagingVO);
	//downloadlist의 갯수
	public int downloadCount(int companyId);
	
	//prjlist갯수
	public int prjcount(int companyId);
	//projectList
	public List<ProjectVO>projectList(@Param("companyId")int companyId,@Param("pagingvo")PagingVO pagingVO);
	
	//수정
	public int updateCompany(CompanyVO companyVO);
}
