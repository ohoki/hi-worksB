package com.worksb.hi.mycalendar.service;

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
	private String scheTitle;
	private String ScheContent;
	private String scheRegdate;
	private String coordinate;
	private String startDate;
	private String endDate;
	private String memberId;
	private String alarmDate;
}
