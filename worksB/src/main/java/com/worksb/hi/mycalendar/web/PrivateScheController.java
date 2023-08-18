package com.worksb.hi.mycalendar.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.mycalendar.service.PrivateScheService;
import com.worksb.hi.mycalendar.service.PrivateScheVO;

@Controller
public class PrivateScheController {
	
	@Autowired
	PrivateScheService privateScheService;
	
	//개인일정 페이지에서 ajax호출 url
	@SuppressWarnings("unchecked")
	@GetMapping("privateScheList")
	@ResponseBody
	public List<Map<String, Object>> myCalendar(HttpServletRequest request) {
		//session에서 사용자 id값 가져와서 개인일정 검색
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		List<PrivateScheVO> priScheList = privateScheService.selectAllPsche(memberId);
		
		//json객체 리스트화
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();
		
		for(int i=0;i<priScheList.size();i++) {
			hash.put("title", priScheList.get(i).getScheTitle()); //제목
			hash.put("start", priScheList.get(i).getStartDate()); //시작일자
			hash.put("end", priScheList.get(i).getEndDate()); //종료일자
			
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
	public String priScheInsert(PrivateScheVO vo, Model model) {
		int insertResult = privateScheService.insertPsche(vo);
		String resultMsg =null;
		if(insertResult == -1) {
			resultMsg = "등록실패";
		}else {
			resultMsg = "등록성공";
		}
		model.addAttribute("result", resultMsg);
		return "mypage/privateCalendar";
	}
	
	
}
