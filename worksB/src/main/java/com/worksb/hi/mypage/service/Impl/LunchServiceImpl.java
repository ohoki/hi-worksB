package com.worksb.hi.mypage.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.mypage.mapper.LunchMapper;
import com.worksb.hi.mypage.service.LunchService;
import com.worksb.hi.mypage.service.LunchVO;

@Service
public class LunchServiceImpl implements LunchService {

	@Autowired
	LunchMapper lunchMapper;
	
	@Override
	public List<LunchVO> selectLunchList() {
		return lunchMapper.selectLunchList();
	}

	@Override
	public List<String> selectLunchCate() {
		List<LunchVO> list = lunchMapper.selectLunchCate();
		List<String> cateList = new ArrayList();
		for(int i=0;i<list.size();i++) {
			String cate = list.get(i).getLunchCategory();
			cateList.add(cate);
		}
		return cateList;
	}

}