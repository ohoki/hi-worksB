package com.worksb.hi.mypage.service;

import java.util.List;

public interface LunchService {
	public List<LunchVO> selectLunchList();
	public List<String> selectLunchCate();
}
