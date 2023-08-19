package com.worksb.hi.project.service;

import lombok.Data;

@Data
public class DeptVO {
/* 이진
DEPT_ID    NOT NULL NUMBER       
DEPT_NAME  NOT NULL VARCHAR2(80) 
COMPANY_ID NOT NULL NUMBER       
 */
	private int deptId;
	private String deptName;
	private int companyId;
}
