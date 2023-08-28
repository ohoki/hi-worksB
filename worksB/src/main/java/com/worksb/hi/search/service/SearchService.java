package com.worksb.hi.search.service;

import java.util.List;

import com.worksb.hi.project.service.ProjectVO;

public interface SearchService {
	//프로젝트 전체보기
	public List<SearchingVO> getAllPrj(String memberId,int companyId,String searchKeyword);
}
