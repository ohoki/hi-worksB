package com.worksb.hi.mycalendar.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.worksb.hi.mycalendar.service.PrivateScheService;

@Controller
public class PrivateScheController {
	
	@Autowired
	PrivateScheService privateScheService;
	
	@GetMapping("privateSche")
	public String myCalendar() {
		
		return "mypage/privateCalendar";
	}
	
	
}
