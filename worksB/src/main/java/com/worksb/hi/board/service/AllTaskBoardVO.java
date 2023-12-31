package com.worksb.hi.board.service;

import lombok.Data;

import lombok.Data;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Data
public class AllTaskBoardVO {
	private int prjBoardId;
	private String prjBoardTitle;
	private String prjBoardSubject;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm" ,timezone = "Asia/Seoul")
	private Date prjBoardRegdate;
	private String memberId;
	private String inspYn;
	private String pinYn;
	private String boardType;
	private int projectId;
	private String coordinate;
	private String memberName;

	private Integer highTaskId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
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
	
	private String realProfilePath;
	
	
}
