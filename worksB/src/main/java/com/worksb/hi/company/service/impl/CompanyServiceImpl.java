package com.worksb.hi.company.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.company.mapper.CompanyMapper;
import com.worksb.hi.company.service.CompanyService;
import com.worksb.hi.company.service.CompanyVO;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyMapper companyMapper;
	
	//단건 조회
	@Override
	public CompanyVO getCompanyByUrl(CompanyVO companyVO) {
		return companyMapper.getCompanyByUrl(companyVO);
	}
	
	//등록
	@Override
	public int insertCompany(CompanyVO companyVO) {
		return companyMapper.insertCompany(companyVO);
	}

}
