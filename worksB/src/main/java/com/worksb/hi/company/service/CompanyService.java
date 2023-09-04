package com.worksb.hi.company.service;

import java.util.List;

public interface CompanyService {
	
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
