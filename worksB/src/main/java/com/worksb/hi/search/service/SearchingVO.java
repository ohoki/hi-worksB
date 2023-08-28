package com.worksb.hi.search.service;

import java.util.Date;

import lombok.Data;

@Data
public class SearchingVO {
	private int prjBoardId;
	private String prjBoardTitle;
	private Date prjBoardRegdate;
	private String memberId;
	private String boardType;
	private String memberName;
	private String projectName;
	
}
