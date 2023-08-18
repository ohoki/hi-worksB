package com.worksb.hi.boardCmt.service;

import java.util.Date;

import lombok.Data;
@Data
public class BoardCmtVO {
	
	private int commentId;
	private String memberId;
	private Date commentRegdate;
	private String commentContent;
	private int boardId;
	private String boardType;
	
}
