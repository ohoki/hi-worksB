package com.worksb.hi.mypage.service;

import lombok.Data;

@Data
public class LunchVO {
//	LUNCH_CATEGORY NOT NULL VARCHAR2(30) 
//	LUNCH_MENU     NOT NULL VARCHAR2(30) 
	private String lunchCategory;
	private String lunchMenu;
}