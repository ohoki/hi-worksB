package com.worksb.hi.chat.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.worksb.hi.common.NewChatRoom;

@Controller
public class ChatRoomController {

	  private final NewChatRoom myService;

	    @Autowired
	    public ChatRoomController(NewChatRoom myService) {
	        this.myService = myService;
	    }

	    @PostMapping("/sendRequest")
	    public String sendRequest(@RequestParam String roomName, Model model) {
	        // 컨트롤러에서 받아온 roomName 값을 MyService로 전달하여 API 호출
	        String apiResponse = myService.sendHttpPostRequest(roomName);
	        
	        // API 호출 결과를 Model에 추가하여 JSP 페이지로 전달
	        model.addAttribute("apiResponse", apiResponse);
	        
	        // JSP 페이지 이름을 반환
	        return "prj/chatting"; // resultPage는 JSP 페이지의 이름
	    }
}
