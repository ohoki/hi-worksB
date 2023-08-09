package com.worksb.hi.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.worksb.hi.notice.service.NoticeService;
import com.worksb.hi.notice.service.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	// 전체조회
	@GetMapping("/noticeList")
	public String getNoticeList(Model model) {
		model.addAttribute("notice", noticeService.getNoticeList());
		return "notice/noticeList";
	}
	
	// 단건 조회
	@GetMapping("/noticeInfo")
	public String getNoticeInfo(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeInfo";
	}
}
