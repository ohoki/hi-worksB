package com.worksb.hi.mycalendar.mapper;

import java.util.List;

import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.mycalendar.service.PrivateScheVO;

public interface PrivateScheMapper {
	
	//단건조회
	public PrivateScheVO selectPsche(int scheId);
	
	//전체조회
	public List<PrivateScheVO> selectAllPsche(String memberId);
	
	//일정등록
	public int insertPsche(PrivateScheVO privateScheVO);
	
	//일정수정
	public int updatePsche(PrivateScheVO privateScheVO);
	
	//일정삭제
	public int deletePsche(int scheId);
	
	//개인이 맡은 프로젝트 업무게시글 조회
	public List<BoardVO> searchMyTask(String memberId);
	
}
