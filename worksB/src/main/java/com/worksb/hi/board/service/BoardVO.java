package com.worksb.hi.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
/* 이진
PRJ_BOARD_ID      NOT NULL NUMBER         
PRJ_BOARD_TITLE   NOT NULL VARCHAR2(100)  
PRJ_BOARD_SUBJECT NOT NULL VARCHAR2(3000) 
PRJ_BOARD_REGDATE NOT NULL DATE           
MEMBER_ID         NOT NULL VARCHAR2(80)   
INSP_YN           NOT NULL VARCHAR2(20)   공개범위
PIN_YN                     VARCHAR2(5)    고정글여부
BOARD_TYPE        NOT NULL VARCHAR2(20)   원글구분
PROJECT_ID        NOT NULL NUMBER         
COORDINATE                 VARCHAR2(60)   
 */
	private int prjBoardId;
	private String prjBoardTitle;
	private String prjBoardSubject;
	private Date prjBoardRegdate;
	private String memberId;
	private String inspYn;
	private String pinYn;
	private String BoardType;
	private int projectId;
	private String coordinate;
	
}
