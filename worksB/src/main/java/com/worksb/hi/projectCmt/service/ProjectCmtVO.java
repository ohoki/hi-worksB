package com.worksb.hi.projectCmt.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class ProjectCmtVO {
/*
MEMBER_ID
COMMENT_REGDATE
COMMENT_CONTENT
COMMENT_ID
BOARD_TYPE
BOARD_ID
DEL_UPD_AUTH  수정삭제권한
 */
	
	private String memberId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date commentRegdate;
	private String commentContent;
	private int commentId;
	private String boardType;
	private int boardId;
	private String delUpdAuth;
	private String realProfilePath;
	private String memberName;
}
