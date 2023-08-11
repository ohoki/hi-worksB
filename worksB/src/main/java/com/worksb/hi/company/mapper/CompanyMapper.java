package com.worksb.hi.company.mapper;

import com.worksb.hi.company.service.CompanyVO;

public interface CompanyMapper {
	
	//단건 조회
	public CompanyVO getCompanyByUrl(CompanyVO companyVO);
	
	//등록
	public int insertCompany(CompanyVO companyVO);
}
