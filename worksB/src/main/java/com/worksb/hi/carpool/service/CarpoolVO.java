package com.worksb.hi.carpool.service;

import java.util.Date;

import lombok.Data;

@Data
public class CarpoolVO {

	private int boardId;
	private String boardTitle;
	private String boardContent;
	private String memberId;
	private Date boardRegdate;
	private Date boardUpddate;
	private int boardHit;
	private String category;
	private String departure;
	private String arrival;
	private Date departureDate;
	private int passenger;
	private String coordinate;
	private String boardType;
	private int companyId;
	
	private String memberName;
}
