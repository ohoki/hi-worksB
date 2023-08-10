package com.worksb.hi.company.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.worksb.hi.company.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;
	
	//회사정보 등록
	@PostMapping("/insertCompany")
	public String insertCompnay() {
		return null;
	}
}
