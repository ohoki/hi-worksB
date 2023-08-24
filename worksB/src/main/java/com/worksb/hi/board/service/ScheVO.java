package com.worksb.hi.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ScheVO {
//이진
/*
START_DATE   NOT NULL DATE   
END_DATE     NOT NULL DATE   
PRJ_BOARD_ID NOT NULL NUMBER 
ALARM_DATE            DATE
 */
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date endDate;
	private int prjBoardId;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date alarmDate;
}
