package com.worksb.hi.mycalendar.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.mycalendar.mapper.ToDoListMapper;
import com.worksb.hi.mycalendar.service.PrivateScheVO;
import com.worksb.hi.mycalendar.service.ToDoListService;
import com.worksb.hi.mycalendar.service.ToDoListVO;

@Service
public class ToDoListServiceImpl implements ToDoListService {
	
	@Autowired
	ToDoListMapper toDoListMapper;
	//단건조회
	@Override
	public ToDoListVO selectTdl(int listId) {
		return toDoListMapper.selectTdl(listId);
	}
	//전체조회
	@Override
	public List<ToDoListVO> selectAllTdl(PrivateScheVO privateScheVO) {
		return toDoListMapper.selectAllTdl(privateScheVO);
	}
	//입력
	@Override
	public int insertTdl(ToDoListVO toDoListVO) {
		return toDoListMapper.insertTdl(toDoListVO);
	}
	//수정
	@Override
	public int updateTdl(ToDoListVO toDoListVO) {
		return toDoListMapper.updateTdl(toDoListVO);
	}
	//삭제
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
	public int deleteItemList(int listId) {
		return toDoListMapper.deleteItemList(listId);
	}
	//ITEM 삭제
	@Override
	public int deleteItem(int itemId) {
		return toDoListMapper.deleteItem(itemId);
	}

}
