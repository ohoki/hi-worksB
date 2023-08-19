package com.worksb.hi.company.mapper;

import java.util.List;

import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.company.service.DepartmentVO;
import com.worksb.hi.company.service.JobVO;

public interface CompanyMapper {
	
	//단건 조회
	public CompanyVO getCompanyByUrl(CompanyVO companyVO);
	public CompanyVO getCompanyById(CompanyVO companyVO);
	
	//등록
	public int insertCompany(CompanyVO companyVO);
	
	//부서조회
	public List<DepartmentVO> getDepartment(CompanyVO companyVO);
	
	//직급조회
	public List<JobVO> getJob(CompanyVO companyVO);
}
