package com.worksb.hi.mycalendar.service;

import java.util.List;
import java.util.Map;

public interface PrivateScheService {
	
	//단건조회
	public PrivateScheVO selectPsche(PrivateScheVO privateScheVO);
	
	//전체조회
	public List<PrivateScheVO> selectAllPsche(String memberId);
	
	//일정등록
	public int insertPsche(PrivateScheVO privateScheVO);
	
	//일정수정
	public int updatePsche(PrivateScheVO privateScheVO);
	
	//일정삭제
	public int deletePsche(PrivateScheVO privateScheVO);
}
