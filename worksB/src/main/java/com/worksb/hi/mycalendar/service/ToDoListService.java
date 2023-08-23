package com.worksb.hi.mycalendar.service;

import java.util.List;

public interface ToDoListService {
	
	//단건조회
	public ToDoListVO selectTdl(int listId);
	//전체조회
	public List<ToDoListVO> selectAllTdl(String memberId);
	//tdl입력
	public int insertTdl(ToDoListVO toDoListVO);
	//tdl수정
	public int updateTdl(ToDoListVO toDoListVO);
	//tdl삭제
	public int deleteTdl(int listId);
}
