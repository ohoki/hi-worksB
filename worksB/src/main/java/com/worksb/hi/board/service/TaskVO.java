package com.worksb.hi.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String priority;
	private String state;
	private String processivity;
	private int prjBoardId;
	private int taskId;
	private int companyId;
}
