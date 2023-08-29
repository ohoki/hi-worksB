package com.worksb.hi.search.service;

import java.util.List;

import com.worksb.hi.project.service.ProjectVO;

public interface SearchService {
	//프로젝트 전체보기
	public List<SearchingVO> getAllPrj(String memberId,int companyId,String searchKeyword);
	//동호회
	public List<SearchingVO> getAllClub(String memberId,String searchKeyword);
	//공지사항
	public List<SearchingVO> getAllNotice(int companyId,String searchKeyword);
	//카풀
	public List<SearchingVO> getAllCarpool(int companyId,String searchKeyword);
	
	
	//날짜조건으로 프로젝트검색
	public List<SearchingVO> getPrj(SearchingVO vo);
	//날짜조건으로 동호회검색
	public List<SearchingVO> getClub(SearchingVO vo);
	//날짜조건으로 공지사항검색
	public List<SearchingVO> getNotice(SearchingVO vo);
	//날짜조건으로 카풀검색
	public List<SearchingVO> getCarpool(SearchingVO vo);
}
