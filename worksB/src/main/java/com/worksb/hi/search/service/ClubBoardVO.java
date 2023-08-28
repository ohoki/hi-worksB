package com.worksb.hi.search.service;

import java.util.Date;

import lombok.Data;

@Data
public class ClubBoardVO {
//	Name          Null?    Type           
//			------------- -------- -------------- 
//			BOARD_ID      NOT NULL NUMBER         
//			BOARD_TITLE   NOT NULL VARCHAR2(100)  
//			BOARD_CONTENT NOT NULL VARCHAR2(3000) 
//			BOARD_REGDATE NOT NULL DATE           
//			BOARD_UPDDATE          DATE           
//			MEMBER_ID     NOT NULL VARCHAR2(80)   
//			COORDINATE             VARCHAR2(60)   
//			BOARD_HIT     NOT NULL NUMBER         
//			NOTICE        NOT NULL VARCHAR2(5)    
//			CLUB_ID       NOT NULL NUMBER         
//			BOARD_TYPE    NOT NULL VARCHAR2(20)   
	
	private Integer boardId;
	private String boardTitle;
	private String boardContent;
	private Date boardRegdate;
	private Date boardupddate;
	private String memberId;
	private String coordinate;
	private Integer boardHit;
	private String notice;
	private Integer clubId;
	private String boardType;
}
