package com.worksb.hi.common;

import lombok.Data;

@Data
public class SearchVO {
	
	private String searchkeyword; 	// 검색어 
	private String searchtype;		// 검색 타입 ex) 제목, 내용, 글쓴이, 제목+내용
	
}
