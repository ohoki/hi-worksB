package com.worksb.hi.mycalendar.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class PrivateScheVO {
//			------------ -------- -------------- 
//			SHCE_ID      NOT NULL NUMBER         
//			SCHE_TITLE   NOT NULL VARCHAR2(100)  
//			SCHE_CONTENT NOT NULL VARCHAR2(3000) 
//			SCHE_REGDATE NOT NULL DATE           
//			COORDINATE            VARCHAR2(60)   
//			START_DATE   NOT NULL DATE           
//			END_DATE     NOT NULL DATE           
//			MEMBER_ID    NOT NULL VARCHAR2(80)   
//			ALARM_DATE            DATE       
	
	private int scheId;
	@JsonProperty(value = "title")
	private String scheTitle;
	private String ScheContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date scheRegdate;
	private String scheAddr;
	private String scheAddrDetail;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonProperty(value = "start")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonProperty(value = "end")
	private Date endDate;
	private String memberId;
	
	//개인 캘린더용 키워드 검색단어
	private String searchKeyword;
}
