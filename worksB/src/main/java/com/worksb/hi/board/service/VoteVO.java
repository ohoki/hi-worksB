package com.worksb.hi.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class VoteVO {
/*
 END_DATE     NOT NULL DATE        종료일시
PRJ_BOARD_ID NOT NULL NUMBER      
ANONY_VOTE   NOT NULL VARCHAR2(5)	익명 투표	A1 YES / A2 NO
COMPNO_VOTE  NOT NULL VARCHAR2(5) 	복수 투표	A1 YES / A2 NO
RESULT_YN    NOT NULL VARCHAR2(5) 	결과 공개 여부 A1 YES / A2 NO
 */
	private int prjBoardId;
	private int voteParticirId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date endDate;
	
	private String anonyVote;
	private String compnoVote;
	private String resultYn;
	
/*
LIST_ID      NOT NULL NUMBER        항목번호
LIST_CONTENT NOT NULL VARCHAR2(200) 항목내용
PRJ_BOARD_ID NOT NULL NUMBER  
 */
	private int listId;
	private String listContent;
	private String prjParticirId;
}
