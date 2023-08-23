package com.worksb.hi.carpool.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;

public interface CarpoolService {
	// 게시물 총 갯수
	public int carpoolCount(SearchVO searchVO);
	
	// 카풀 게시물 리스트
	public List<CarpoolVO> getCarpoolList(PagingVO pagingVO, SearchVO searchVO);
	
	// 카풀 게시판 단건조회
	public CarpoolVO getCarpoolInfo(CarpoolVO carpoolVO);
	
	// 카풀 게시판 등록
	public int carpoolInsert(CarpoolVO carpoolVO);
	
	//수정
	public int carpoolUpdate(CarpoolVO carpoolVO);
	
	//삭제
	public int carpoolDelete(int boardId);
}
