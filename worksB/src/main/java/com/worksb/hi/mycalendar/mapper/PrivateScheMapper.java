package com.worksb.hi.mycalendar.mapper;

import java.util.List;

import com.worksb.hi.mycalendar.service.PrivateScheVO;

public interface PrivateScheMapper {
	
	//단건조회
	public PrivateScheVO selectPsche(PrivateScheVO privateScheVO);
	
	//전체조회
	public List<PrivateScheVO> selectAllPche(PrivateScheVO privateScheVO);
	
	//일정등록
	public int insertPsche(PrivateScheVO privateScheVO);
	
	//일정수정
	public int updatePsche(PrivateScheVO privateScheVO);
	
	//일정삭제
	public int deletePsche(PrivateScheVO privateScheVO);
	
}
