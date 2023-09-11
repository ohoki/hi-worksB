package com.worksb.hi.mycalendar.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.mycalendar.mapper.PrivateScheMapper;
import com.worksb.hi.mycalendar.service.PrivateScheService;
import com.worksb.hi.mycalendar.service.PrivateScheVO;

@Service
public class PrivateScheServiceImpl implements PrivateScheService {

	@Autowired
	PrivateScheMapper privateScheMapper;
	
	//단건조회
	@Override
	public PrivateScheVO selectPsche(int scheId) {
		return privateScheMapper.selectPsche(scheId);
	}
	
	//전체조회
	@Override
	public List<PrivateScheVO> selectAllPsche(PrivateScheVO privateScheVO) {
		return privateScheMapper.selectAllPsche(privateScheVO);
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
	//일정수정
	@Override
	public int updatePsche(PrivateScheVO privateScheVO) {
		int result = privateScheMapper.updatePsche(privateScheVO);
		return result;
	}
	//일정삭제
	@Override
	public int deletePsche(int scheId) {
		int result = privateScheMapper.deletePsche(scheId);
		return result;
	}
	//개인이 맡은 업무게시글번호 조회
	@Override
	public List<BoardVO> searchMyTask(PrivateScheVO privateScheVO) {
		return privateScheMapper.searchMyTask(privateScheVO);
	}

}
