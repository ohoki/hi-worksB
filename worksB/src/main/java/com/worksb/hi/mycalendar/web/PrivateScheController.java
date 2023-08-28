package com.worksb.hi.mycalendar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.mycalendar.service.PrivateScheService;
import com.worksb.hi.mycalendar.service.PrivateScheVO;
import com.worksb.hi.mycalendar.service.ToDoListService;
import com.worksb.hi.mycalendar.service.ToDoListVO;

//2023-08-18 김정현 개인일정관리

@Controller
public class PrivateScheController {
	
	@Autowired
	PrivateScheService privateScheService;
	
	@Autowired
	ToDoListService toDoListService;
	
	//개인일정 페이지에서 ajax호출 url
	@SuppressWarnings("unchecked")
	@GetMapping("privateScheList")
	@ResponseBody
	public List<Map<String, Object>> myCalendar(HttpSession session) {
		
		//session에서 사용자 id값 가져와서 개인일정/todoList 검색
		MemberVO vo = (MemberVO) session.getAttribute("memberInfo");
		List<PrivateScheVO> priScheList = privateScheService.selectAllPsche(vo.getMemberId());
		List<ToDoListVO> tdlList = toDoListService.selectAllTdl(vo.getMemberId());
		
		//json객체 리스트화
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();
		
		for(int i=0;i<priScheList.size();i++) {
			hash.put("id", priScheList.get(i).getScheId());//단건조회용 sche_id 입력
			hash.put("title", priScheList.get(i).getScheTitle()); //제목
			hash.put("start", priScheList.get(i).getStartDate()); //시작일자
			hash.put("end", priScheList.get(i).getEndDate()); //종료일자
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		for(int i=0;i<tdlList.size();i++) {
			hash.put("id", "t"+tdlList.get(i).getListId());
			hash.put("title", tdlList.get(i).getListTitle());
			hash.put("start", tdlList.get(i).getApplyDate());
			hash.put("end", "");
			hash.put("allDay", "true");
			hash.put("color", "#2a9d8f");
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		
		return jsonArr;
	}
	
	//개인일정 페이지 불러오기
	@GetMapping("privateSche")
	public String viewPriCalendar() {
		
		return "mypage/privateCalendar";
	}
	
	//개인일정 입력
	@PostMapping("priScheInsert")
	@ResponseBody
	public String priScheInsert(PrivateScheVO vo) {
		int insertResult = privateScheService.insertPsche(vo);
		String resultMsg =null;
		if(insertResult == -1) {
			resultMsg = "등록실패";
		}else {
			resultMsg = "등록성공";
		}
		return resultMsg;
	}

	
	
	//개인일정 단건조회
	@GetMapping("selectPsche")
	@ResponseBody
	public PrivateScheVO viewPsche(PrivateScheVO vo, Model model) {
		PrivateScheVO scheVO = new PrivateScheVO();
		scheVO.setScheId(vo.getScheId());
		scheVO = privateScheService.selectPsche(scheVO);
		model.addAttribute("priSche", scheVO);
		return scheVO;
	}
	
	
	//개인일정 수정
	@PostMapping("updatePsche")
	@ResponseBody
	public String updatePsche(PrivateScheVO vo) {
		int result = privateScheService.updatePsche(vo);
		String resultMsg;
		if(result==1) {
			resultMsg = "success";
		}else {
			resultMsg = "fail";
		}
		return resultMsg;
	}
	
	//개인일정 삭제
	@GetMapping("deletePsche")
	@ResponseBody
	public String deletePshce(PrivateScheVO vo) {
		int result = privateScheService.deletePsche(vo.getScheId());
		String resultMsg;
		if(result==1) {
			resultMsg = "success";
		}else {
			resultMsg = "fail";
		}
		return resultMsg;
	}
	
	//todoList 단건조회
	@SuppressWarnings("unchecked")
	@GetMapping("selectTdl")
	@ResponseBody
	public Map<String, List<ToDoListVO>> viewTodoList(int listId) {
		ToDoListVO tdlVO= toDoListService.selectTdl(listId);
		List<ToDoListVO> listVO = new ArrayList<ToDoListVO>(); 
		listVO.add(tdlVO);
		List<ToDoListVO> listItemVO = toDoListService.selelctTdlItem(tdlVO.getListId());
		
		HashMap<String, List<ToDoListVO>> map = new HashMap<String, List<ToDoListVO>>();
		map.put("todoList", listVO);
		map.put("item", listItemVO);
		
		return map;
	};
	
	//ToDo List 입력
	@PostMapping("todoListInsert")
	@ResponseBody
	public String todoListInsert(@RequestBody List<ToDoListVO> tdlList) {
		System.out.println(tdlList);
		//리스트의 첫번째는 todoList이므로 List테이블에 인서트
		ToDoListVO tdlListVO = tdlList.get(0);
		int result = toDoListService.insertTdl(tdlListVO);
		//리스트의 두번째부터는 todoListItem이므로 Item테이블에 인서트
		ToDoListVO tdlItemVO = new ToDoListVO();
		int itemResult =0;
		for(int i = 1;i<tdlList.size();i++) {
			if(tdlList.get(i).getContent()!=null) {
				tdlItemVO.setListId(tdlListVO.getListId());
				tdlItemVO.setContent(tdlList.get(i).getContent()); 
				tdlItemVO.setSuccess(tdlList.get(i).getSuccess());
				itemResult =+ toDoListService.insertItem(tdlItemVO);
			}
		}
		String resultMsg;
		if(result ==1 && itemResult != 0) {
			resultMsg = itemResult+"success";
		}else {
			resultMsg = "fail";
		}
		return resultMsg;
	}
	//todoList 수정
	@PostMapping("updateToDoList")
	@ResponseBody
	public String updateTdlList(@RequestBody Map<String, List<ToDoListVO>> tdlData) {
	    List<ToDoListVO> todoList = tdlData.get("todoList");
	    List<ToDoListVO> updateList = tdlData.get("update");
	    List<ToDoListVO> deleteList = tdlData.get("delete");
	    List<ToDoListVO> insertList = tdlData.get("insert");
	    System.out.println(tdlData);
	    if(todoList!=null) {
	    	toDoListService.updateTdl(todoList.get(0));
	    }
	    if(updateList!=null) {
	    	for(int i=0;i<updateList.size();i++) {
	    		toDoListService.updateItem(updateList.get(i));
	    	}
	    }
	    if(deleteList!=null) {
	    	for(int i=0;i<deleteList.size();i++) {
	    		toDoListService.deleteItem(deleteList.get(i).getItemId());
	    	}
	    }
	    if(insertList!=null) {
	    	for(int i=0;i<insertList.size();i++) {
	    		toDoListService.insertItem(insertList.get(i));
	    	}
	    }
	    String result = "success";
	    return result;
	}
	
	//todoList 삭제
	@GetMapping("deleteToDoList")
	@ResponseBody
	public String deleteTdlList(ToDoListVO vo) {
		int result = toDoListService.deleteTdl(vo.getListId());
		toDoListService.deleteItem(vo.getListId());
		String resultMsg;
		if(result==1) {
			resultMsg = "success";
		}else {
			resultMsg = "fail";
		}
		return resultMsg;
	}
	
	//todoList ITEM 삭제
	
}
