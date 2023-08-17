package com.worksb.hi.notice.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.worksb.hi.member.service.MemberVO;

import lombok.Data;

@Data
public class NoticeVO {

	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String memberId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date boardRegdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date boardUpddate;
	private String coordinate;
	private int boardHit;
	private String boardType;
	private int companyId;
	
	private String memberName;
	
	
	

	
}
