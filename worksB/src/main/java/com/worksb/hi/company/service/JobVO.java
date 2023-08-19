package com.worksb.hi.company.service;

import lombok.Data;

@Data
public class JobVO {
//	JOB_ID     NOT NULL NUMBER       
//	JOB_NAME   NOT NULL VARCHAR2(40) 
//	COMPANY_ID NOT NULL NUMBER
	private int jobId;
	private String jobName;
	private Integer companyId;
}
