package com.worksb.hi.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TaskVO {
/* 이진
HIGH_TASK_ID          NUMBER   메인업무번호    
START_DATE            DATE         
END_DATE              DATE         
PRIORITY              VARCHAR2(20) 우선순위
STATE        NOT NULL VARCHAR2(20) 업무상태
PROCESSIVITY          VARCHAR2(20) 진척도
PRJ_BOARD_ID NOT NULL NUMBER       
TASK_ID      NOT NULL NUMBER       
COMPANY_ID   NOT NULL NUMBER
 */
	private Integer highTaskId;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date endDate;
	
	private String priority;
	private String priorityName;
	private String state;
	private String stateName;
	private String processivity;
	private Integer prjBoardId;
	private int taskId;
	private int companyId;
	private String prjBoardTitle;
	
/*
PRJ_BOARD_ID
PRJ_PARTICIR_ID
RESP_ID
 */
	private int prjParticirId;
	private int respId;
	private String memberName;
	
	private int projectId;
}
