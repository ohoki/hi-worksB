package com.worksb.hi.company.service;

import lombok.Data;

@Data
public class DepartmentVO {
//	DEPT_ID    NOT NULL NUMBER       
//	DEPT_NAME  NOT NULL VARCHAR2(80) 
//	COMPANY_ID NOT NULL NUMBER
	private int deptId;
	private String deptName;
	private Integer companyId;
}
