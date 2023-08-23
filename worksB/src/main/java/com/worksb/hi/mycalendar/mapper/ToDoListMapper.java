package com.worksb.hi.mycalendar.mapper;

import java.util.List;

import com.worksb.hi.mycalendar.service.ToDoListVO;

public interface ToDoListMapper {
	//단건조회
	public ToDoListVO selectTdl(int tdlId);
	//전체조회
	public List<ToDoListVO> selectAllTdl(String memberId);
	//tdl입력
	public int insertTdl(ToDoListVO vo);
	//tdl수정
	public int updateTdl(ToDoListVO vo);
	//tdl삭제
	public int deleteTdl(int tdlId);
}
