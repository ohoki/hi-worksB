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

	@Override
	public List<SearchingVO> getAllClub(String memberId,String searchKeyword) {
		return mapper.getAllClub(memberId,searchKeyword);
	}

	@Override
	public List<SearchingVO> getAllNotice(int companyId,String searchKeyword) {
		return mapper.getAllNotice(companyId,searchKeyword);
	}

	@Override
	public List<SearchingVO> getAllCarpool(int companyId,String searchKeyword) {
		return mapper.getAllCarpool(companyId,searchKeyword);
	}

	@Override
	public List<SearchingVO> getPrj(SearchingVO vo) {
		return mapper.getPrj(vo);
	}

	@Override
	public List<SearchingVO> getClub(SearchingVO vo) {
		return mapper.getClub(vo);
	}

	@Override
	public List<SearchingVO> getNotice(SearchingVO vo) {
		return mapper.getNotice(vo);
	}

	@Override
	public List<SearchingVO> getCarpool(SearchingVO vo) {
		return mapper.getCarpool(vo);
	}


}
