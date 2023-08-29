package com.worksb.hi.search.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.search.service.SearchingVO;

public interface SearchMapper {
	//프로젝트 전체보기
	public List<SearchingVO> getAllPrj(@Param("memberId")String memberId,@Param("companyId")int companyId,@Param("SearchKeyword")String searchKeyword);
	//동호회
	public List<SearchingVO> getAllClub(@Param("memberId")String memberId,@Param("SearchKeyword")String searchKeyword);
	//공지사항
	public List<SearchingVO> getAllNotice(@Param("companyId")int companyId,@Param("SearchKeyword")String searchKeyword);
	//카풀
	public List<SearchingVO> getAllCarpool(@Param("companyId")int companyId,@Param("SearchKeyword")String searchKeyword);


	//날짜조건으로 프로젝트검색
	public List<SearchingVO> getPrj(SearchingVO vo);
	//날짜조건으로 동호회검색
	public List<SearchingVO> getClub(SearchingVO vo);
	//날짜조건으로 공지사항검색
	public List<SearchingVO> getNotice(SearchingVO vo);
	//날짜조건으로 카풀검색
	public List<SearchingVO> getCarpool(SearchingVO vo);
}
