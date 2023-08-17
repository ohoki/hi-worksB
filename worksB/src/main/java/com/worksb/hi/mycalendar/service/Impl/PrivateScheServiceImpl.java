package com.worksb.hi.mycalendar.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.mycalendar.mapper.PrivateScheMapper;
import com.worksb.hi.mycalendar.service.PrivateScheService;
import com.worksb.hi.mycalendar.service.PrivateScheVO;

@Service
public class PrivateScheServiceImpl implements PrivateScheService {

	@Autowired
	PrivateScheMapper privateScheMapper;
	
	@Override
	public PrivateScheVO selectPsche(PrivateScheVO privateScheVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrivateScheVO> selectAllPsche(PrivateScheVO privateScheVO) {
		return privateScheMapper.selectAllPsche(privateScheVO);
	}

	@Override
	public int insertPsche(PrivateScheVO privateScheVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePsche(PrivateScheVO privateScheVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePsche(PrivateScheVO privateScheVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
