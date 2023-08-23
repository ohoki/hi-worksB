package com.worksb.hi.carpool.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.carpool.mapper.CarpoolMapper;
import com.worksb.hi.carpool.service.CarpoolService;
import com.worksb.hi.carpool.service.CarpoolVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	
	@Autowired
	CarpoolMapper carpoolMapper;
	
	@Override
	public int carpoolCount(SearchVO searchVO) {
		return carpoolMapper.getCarpoolCount(searchVO);
		
	}

	@Override
	public List<CarpoolVO> getCarpoolList(PagingVO pagingVO, SearchVO searchVO) {
		return carpoolMapper.selectCarpoolAll(pagingVO, searchVO);
	}

	@Override
	public CarpoolVO getCarpoolInfo(CarpoolVO carpoolVO) {
		return carpoolMapper.getCarpoolInfo(carpoolVO);
	}
	
	// 등록
	@Override
	public int carpoolInsert(CarpoolVO carpoolVO) {
		int result = carpoolMapper.carpoolInsert(carpoolVO);
		if(result == 1) {
			return carpoolVO.getBoardId();
		}else {
			return 0;
		}
	}
	
	// 수정
	@Override
	public int carpoolUpdate(CarpoolVO carpoolVO) {
		int result = carpoolMapper.carpoolUpdate(carpoolVO);
		if(result == 1) {
			return carpoolVO.getBoardId();
		}else {
			return 0;
		}
	}
	// 삭제
	@Override
	public int carpoolDelete(int boardId) {
		int result = carpoolMapper.carpoolDelete(boardId);
		if(result == 1) {
			return boardId;
		}else {
			return 0;
		}
	}

}
