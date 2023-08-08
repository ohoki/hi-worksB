package com.worksb.hi.project.service;

import lombok.Data;

@Data
public class ProjectVO {
	//이진
/*
PROJECT_ID     NOT NULL NUMBER        
PROJECT_NAME   NOT NULL VARCHAR2(100) 
PROJECT_ACCESS NOT NULL VARCHAR2(20)  
MANAGER_ACCP   NOT NULL VARCHAR2(5)   
WRITE_ACCESS   NOT NULL VARCHAR2(100) 
UPDATE_ACCESS  NOT NULL VARCHAR2(100) 
BOARD_ACCESS   NOT NULL VARCHAR2(100) 
COMMENT_ACCESS NOT NULL VARCHAR2(100) 
FILE_ACCESS    NOT NULL VARCHAR2(100) 
DEPARTMENT_ID  NOT NULL NUMBER        
PROJECT_CLS             VARCHAR2(5)
 */
	
	private int projectId;
	private String projectName;
	private String projectAccess;
	private String managerAccp;
	private String writeAccess;
	private String updateAccess;
	private String boardAccess;
	private String commentAccess;
	private String fileAccess;
	private int departmentId;
	private String projectCls;
	
	
	
	
	
	
	//주현
}
