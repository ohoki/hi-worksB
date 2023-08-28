package com.worksb.hi.mycalendar.service;

import java.util.List;

public interface ToDoListService {
	
	//LIST 단건조회
	public ToDoListVO selectTdl(int listId);
	
	//LIST 전체조회
	public List<ToDoListVO> selectAllTdl(String memberId);
	
	//LIST 입력
	public int insertTdl(ToDoListVO toDoListVO);
	
	//LIST 수정
	public int updateTdl(ToDoListVO toDoListVO);
	
	//LIST 삭제
	public int deleteTdl(int listId);
	
	//ITEM 조회
	public List<ToDoListVO> selelctTdlItem(int listId);
	
	//ITEM 입력
	public int insertItem(ToDoListVO vo);
	
	//ITEM 수정
	public int updateItem(ToDoListVO toDoListVO);
	
	//ITEM 삭제
	public int deleteItem(int listId);
}
