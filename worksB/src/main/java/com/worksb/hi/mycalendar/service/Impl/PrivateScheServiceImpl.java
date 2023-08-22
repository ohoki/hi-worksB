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
	
	//단건조회
	@Override
	public PrivateScheVO selectPsche(PrivateScheVO privateScheVO) {
		return privateScheMapper.selectPsche(privateScheVO.getScheId());
	}
	
	//전체조회
	@Override
	public List<PrivateScheVO> selectAllPsche(String memberId) {
		return privateScheMapper.selectAllPsche(memberId);
	}
	
	//일정입력
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
		int result = privateScheMapper.updatePsche(privateScheVO);
		return result;
	}

	@Override
	public int deletePsche(int scheId) {
		int result = privateScheMapper.deletePsche(scheId);
		return result;
	}

}
