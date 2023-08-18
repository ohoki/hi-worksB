package com.worksb.hi.carpool.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;

public interface CarpoolService {
	// 게시물 총 갯수
	public int carpoolCount(SearchVO searchVO);
	
	// 공지 리스트
	public List<CarpoolVO> getCarpoolList(PagingVO pagingVO, SearchVO searchVO);
}
