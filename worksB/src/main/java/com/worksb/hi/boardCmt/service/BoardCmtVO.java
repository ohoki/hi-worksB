package com.worksb.hi.boardCmt.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class BoardCmtVO {
	
	private int commentId; // 댓글 ID
	private String memberId; // 작성자 ID
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date commentRegdate; // 작성일시
	private String commentContent; // 댓글 내용
	private int boardId; // 게시글 ID
	private String boardType; // 게시글 타입 (필요시)
	private String parentId; // 부모 댓글 작성자 ID
	private String deleted;
	private String realProfilePath;
	
	private String memberName;
}