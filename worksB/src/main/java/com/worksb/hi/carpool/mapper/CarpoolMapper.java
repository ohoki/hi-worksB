package com.worksb.hi.carpool.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.carpool.service.CarpoolVO;

public interface CarpoolMapper {
	
	// 페이징 게시물 총 갯수
	public int getCarpoolCount(SearchVO searchVO);
	
	// 페이징 게시글 전체 조회
	public List<CarpoolVO> selectCarpoolAll(@Param("pagingVO") PagingVO pagingVO, @Param("searchVO")SearchVO searchVO);
	
}
