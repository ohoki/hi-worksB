package com.worksb.hi.mypage.mapper;

import java.util.List;

import com.worksb.hi.mypage.service.LunchVO;

public interface LunchMapper {
	public List<LunchVO> selectLunchList();
	public List<LunchVO> selectLunchCate();
}