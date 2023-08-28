package com.worksb.hi.boardCmt.service;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class BoardCmtVO {
	
	private int commentId; // 댓글 ID
	private String memberId; // 작성자 ID
	private Date commentRegdate; // 작성일시
	private String commentContent; // 댓글 내용
	private int boardId; // 게시글 ID
	private String boardType; // 게시글 타입 (필요시)
	private int commentDep; // 댓글 깊이 (0: 댓글, 1 이상: 대댓글)
	
	private List<BoardCmtVO> replies; // 대댓글 목록
	
}
