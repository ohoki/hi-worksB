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
	public List<CarpoolVO> getCarpoolList(PagingVO pagingVO, SearchVO searchVO,int companyId) {
		return carpoolMapper.selectCarpoolAll(pagingVO, searchVO,companyId);
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

	@Override
	public int getPCount(int boardId) {
		return carpoolMapper.getPCount(boardId);
	}

	@Override
	public int applyCarpool(CarpoolVO vo) {
		return carpoolMapper.applyCarpool(vo);
	}

	@Override
	public String getApplicantName(String memberId) {
		return carpoolMapper.getApplicantName(memberId);
	}

	@Override
	public List<CarpoolVO> getApplicantList(int boardId) {
		return carpoolMapper.getApplicantList(boardId);
	}

	@Override
	public int cancelCarpool(int boardId) {
		return carpoolMapper.cancelCarpool(boardId);
	}

}
