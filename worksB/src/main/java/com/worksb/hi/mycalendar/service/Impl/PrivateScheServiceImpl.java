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
		return privateScheMapper.selectPsche(privateScheVO.getScheId());
	}

	@Override
	public List<PrivateScheVO> selectAllPsche(String memberId) {
		return privateScheMapper.selectAllPsche(memberId);
	}

	@Override
	public int insertPsche(PrivateScheVO privateScheVO) {
		int result = privateScheMapper.insertPsche(privateScheVO);
		if(result ==1) {
			return privateScheVO.getScheId();
		}else {
			return -1;
		}
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
