package com.worksb.hi.mycalendar.service;

import lombok.Data;

@Data
public class ToDoListVO {
//	LIST_ID      NOT NULL NUMBER        
//	LIST_TITLE   NOT NULL VARCHAR2(100) 
//	LIST_REGDATE NOT NULL DATE          
//	MEMBER_ID    NOT NULL VARCHAR2(80)  
//	APPLY_DATE   NOT NULL DATE   
	private int listId;
	private String listTitle;
	private String listRegdate;
	private String memberId;
	private String applyDate;
}
