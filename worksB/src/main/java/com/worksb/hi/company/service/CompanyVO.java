package com.worksb.hi.company.service;

import lombok.Data;

@Data
public class CompanyVO {
//	COMPANY_ID     NOT NULL NUMBER        
//	COMPANY_NAME   NOT NULL VARCHAR2(80)  
//	COMPANY_URL    NOT NULL VARCHAR2(100) 
//	LOGO_PATH               VARCHAR2(200) 
//	REAL_LOGO_PATH          VARCHAR2(200) 
//	COMPANY_ADDR   NOT NULL VARCHAR2(80)  
//	ADM_ACCP       NOT NULL VARCHAR2(5)  
	private Integer companyId;
	private String companyName;
	private String companyUrl;
	private String logoPath;
	private String realLogoPath;
	private String companyAddr;
	private String admAccp;
}
