package com.worksb.hi.board.service;

import lombok.Data;

import lombok.Data;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@Data
public class AllTaskBoardVO {
	private int prjBoardId;
	private String prjBoardTitle;
	private String prjBoardSubject;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date prjBoardRegdate;
	private String memberId;
	private String inspYn;
	private String pinYn;
	private String boardType;
	private int projectId;
	private String coordinate;
	private String memberName;

	private Integer highTaskId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String priority;
	private String priorityName;
	private String state;
	private String stateName;
	private String processivity;
	private int taskId;
	private int companyId;
	
	private int prjParticirId;
	private int respId;
	
	
}
