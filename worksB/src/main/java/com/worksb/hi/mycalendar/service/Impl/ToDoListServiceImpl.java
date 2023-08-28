package com.worksb.hi.mycalendar.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.mycalendar.mapper.ToDoListMapper;
import com.worksb.hi.mycalendar.service.ToDoListService;
import com.worksb.hi.mycalendar.service.ToDoListVO;

@Service
public class ToDoListServiceImpl implements ToDoListService {
	
	@Autowired
	ToDoListMapper toDoListMapper;
	
	@Override
	public ToDoListVO selectTdl(int listId) {
		return toDoListMapper.selectTdl(listId);
	}

	@Override
	public List<ToDoListVO> selectAllTdl(String memberId) {
		return toDoListMapper.selectAllTdl(memberId);
	}

	@Override
	public int insertTdl(ToDoListVO toDoListVO) {
		return toDoListMapper.insertTdl(toDoListVO);
	}

	@Override
	public int updateTdl(ToDoListVO toDoListVO) {
		return toDoListMapper.updateTdl(toDoListVO);
	}

	@Override
	public int deleteTdl(int listId) {
		int result = toDoListMapper.deleteTdl(listId);
		return result;
	}
	
	//ITEM 조회
	@Override
	public List<ToDoListVO> selelctTdlItem(int listId) {
		return toDoListMapper.selelctTdlItem(listId);
	}

	//ITEM 입력
	@Override
	public int insertItem(ToDoListVO toDoListVO) {
		return toDoListMapper.insertItem(toDoListVO);
	}
	
	//ITEM 수정
	@Override
	public int updateItem(ToDoListVO toDoListVO) {
		return toDoListMapper.updateItem(toDoListVO);
	}
	
	//ITEM 삭제
	@Override
	public int deleteItem(int listId) {
		return toDoListMapper.deleteItem(listId);
	}

}
