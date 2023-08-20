package com.worksb.hi.company.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.company.mapper.CompanyMapper;
import com.worksb.hi.company.service.CompanyService;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.company.service.DepartmentVO;
import com.worksb.hi.company.service.JobVO;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyMapper companyMapper;
	
	//단건 조회
	@Override
	public CompanyVO getCompanyByUrl(CompanyVO companyVO) {
		return companyMapper.getCompanyByUrl(companyVO);
	}
	@Override
	public CompanyVO getCompanyById(CompanyVO companyVO) {
		return companyMapper.getCompanyById(companyVO);
	}
	
	//등록
	@Override
	public int insertCompany(CompanyVO companyVO) {
		return companyMapper.insertCompany(companyVO);
	}
	
	//부서 조회
	@Override
	public List<DepartmentVO> getDepartment(CompanyVO companyVO) {
		return companyMapper.getDepartment(companyVO);
	}

	//직급 조회
	@Override
	public List<JobVO> getJob(CompanyVO companyVO) {
		return companyMapper.getJob(companyVO);
	}
}
