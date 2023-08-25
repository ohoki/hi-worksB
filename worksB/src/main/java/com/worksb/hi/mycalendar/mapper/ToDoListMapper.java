package com.worksb.hi.mycalendar.mapper;

import java.util.List;

import com.worksb.hi.mycalendar.service.ToDoListVO;

public interface ToDoListMapper {
	//LIST 단건조회
	public ToDoListVO selectTdl(int tdlId);
	//LIST 전체조회
	public List<ToDoListVO> selectAllTdl(String memberId);
	//LIST 입력
	public int insertTdl(ToDoListVO vo);
	//LIST 수정
	public int updateTdl(ToDoListVO vo);
	//List 삭제
	public int deleteTdl(int tdlId);
	
	//ITEM 조회
	public List<ToDoListVO> selelctTdlItem(int listId);
	//ITEM 입력
	public int insertItem(ToDoListVO vo);
	
}
