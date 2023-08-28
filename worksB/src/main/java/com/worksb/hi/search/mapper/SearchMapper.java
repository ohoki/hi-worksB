package com.worksb.hi.search.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.search.service.SearchingVO;

public interface SearchMapper {
	//프로젝트 전체보기
	public List<SearchingVO> getAllPrj(@Param("memberId")String memberId,@Param("companyId")int companyId,@Param("SearchKeyword")String searchKeyword);
}
