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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTdl(ToDoListVO toDoListVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTdl(int listId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
