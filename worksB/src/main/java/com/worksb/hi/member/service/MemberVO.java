package com.worksb.hi.member.service;

import lombok.Data;

@Data
public class MemberVO {
//	MEMBER_ID         NOT NULL VARCHAR2(80) 
//	MEMBER_NAME       NOT NULL VARCHAR2(80)  
//	MEMBER_PW         NOT NULL VARCHAR2(256) 
//	MEMBER_PHONE               VARCHAR2(80)  
//	PROFILE_PATH               VARCHAR2(200) 
//	REAL_PROFILE_PATH          VARCHAR2(200) 
//	MEMBER_GRADE      NOT NULL VARCHAR2(5)   
//	CON_IP            NOT NULL VARCHAR2(100) 
//	JOB_ID                     NUMBER        
//	DEPT_ID                    NUMBER        
//	EMP_STATUS                 VARCHAR2(5)   
//	CON_STATUS                 VARCHAR2(5)   
//	COMPANY_ID        NOT NULL NUMBER        
//	LOGIN_FAIL                 NUMBER        
//	LOGIN_LOCK        NOT NULL VARCHAR2(5)
//	MAIL_KEY                   VARCHAR2(50)  
//	MAIL_AUTH                  NUMBER
//  COMPANY_ACCP               VARCHAR2(20)  
	
	private String memberId;
	private String memberName;
	private String memberPw;
	private String memberPhone;
	private String profilePath;
	private String realProfilePath;
	private String memberGrade;
	private String memberGradeLiteral;
	private String conIp;
	private Integer jobId;
	private String jobName;
	private Integer deptId;
	private String deptName;
	private String empStatus;
	private String conStatus;
	private Integer companyId;
	private String companyName;
	private int loginFail;
	private String loginLock;
	private String mailKey;
	private int mailAuth;
	private String companyAccp;
	private String role;
	
	private String projectName;
	private String projectId;
	private String noticeTitle;
	private int noticeId;
	private String memoContent;
	private int particirNumber;
	private String gradeName;
	private String projectMarkup;
}
