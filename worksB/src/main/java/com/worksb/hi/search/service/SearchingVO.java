package com.worksb.hi.search.service;

import java.util.Date;

import lombok.Data;

@Data
public class SearchingVO {
	//project
	private int prjBoardId;
	private String prjBoardTitle;
	private Date prjBoardRegdate;
	private String memberId;
	private String boardType;
	private String memberName;
	private String projectName;
	private int projectId;
	
	//club_board
//	Name          Null?    Type           
//			------------- -------- -------------- 
//			BOARD_ID      NOT NULL NUMBER         
//			BOARD_TITLE   NOT NULL VARCHAR2(100)  
//			BOARD_CONTENT NOT NULL VARCHAR2(3000) 
//			BOARD_REGDATE NOT NULL DATE           
//			BOARD_UPDDATE          DATE           
//			COORDINATE             VARCHAR2(60)   
//			BOARD_HIT     NOT NULL NUMBER         
//			NOTICE        NOT NULL VARCHAR2(5)    
//			CLUB_ID       NOT NULL NUMBER          
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private Date boardRegdate;
	private Date boardUpddate;
	private String coordinate;
	private int boardHit;
	private String notice;
	private int clubId;
	
	
	
	
	
	
	//notice_board
//	Name           Null?    Type           
//			-------------- -------- -------------- 
//			NOTICE_ID      NOT NULL NUMBER         
//			NOTICE_TITLE   NOT NULL VARCHAR2(100)  
//			NOTICE_CONTENT NOT NULL VARCHAR2(3000) 
//			MEMBER_ID      NOT NULL VARCHAR2(80)           
//			COMPANY_ID     NOT NULL NUMBER         
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String memeberId;
	private int companyId;
	
	
	
	
	//carpool_board
//	Name           Null?    Type           
//			-------------- -------- --------------           
//			CATEGORY       NOT NULL VARCHAR2(30)   
//			DEPARTURE      NOT NULL VARCHAR2(100)  
//			ARRIVAL        NOT NULL VARCHAR2(100)  
//			DEPARTURE_DATE NOT NULL VARCHAR2(20)   
//			PASSENGER      NOT NULL NUMBER         
	private String category;
	private String departure;
	private String arrival;
	private Date departureDate;
	private int passenger;
	private String SearchKeyword;
	
	
	
	
	
	private String searchKeyword;
	private String startDate;
	private String endDate;
	
}
