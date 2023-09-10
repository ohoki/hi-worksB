package com.worksb.hi.carpool.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date departureDate;
	private int passenger;
	private String coordinate;
	private String boardType;
	private int companyId;
	private int applicant;
	private String memberName;
	private int car_vote_particir_id;
	
}
