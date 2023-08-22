package com.worksb.hi.project.service;

import lombok.Data;

@Data
public class PrjParticirVO {
/* 이진
참여자 테이블
PRJ_PARTICIR_ID NOT NULL NUMBER       
MEMBER_ID       NOT NULL VARCHAR2(80) 
MANAGER                  VARCHAR2(5)  프로젝트 관리자 여부
PROJECT_ID      NOT NULL NUMBER       
ALARM_YN        NOT NULL VARCHAR2(5)  
PROJECT_MARKUP           VARCHAR2(5)  즐겨찾기
particir_accp 
 */
	private int prjParticirId;
	private String memberId;
	private String manager;
	private int projectId;
	private String alarmYn;
	private String projectMarkup;
	private String particirAccp;
	
	private String memberName;
	private String realProfilePath;
}
