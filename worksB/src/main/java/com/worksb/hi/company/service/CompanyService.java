package com.worksb.hi.company.service;

public interface CompanyService {
	
	//단건 조회
	public CompanyVO getCompanyByUrl(CompanyVO companyVO);
	
	//등록
	public int insertCompany(CompanyVO companyVO);
	
}
