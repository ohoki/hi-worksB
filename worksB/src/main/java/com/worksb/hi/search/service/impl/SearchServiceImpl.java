package com.worksb.hi.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.search.mapper.SearchMapper;
import com.worksb.hi.search.service.SearchService;
import com.worksb.hi.search.service.SearchingVO;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	SearchMapper mapper;

	@Override
	public List<SearchingVO> getAllPrj(String memberId, int companyId,String searchKeyword) {
		return mapper.getAllPrj(memberId, companyId,searchKeyword);
	}

}
