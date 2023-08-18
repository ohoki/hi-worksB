package com.worksb.hi.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.notice.service.NoticeService;
import com.worksb.hi.notice.service.NoticeVO;

// 2023.08.18 이동민 공지사항
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	//페이징 전체조회
	@GetMapping("noticeList")
	public String noticeList(Model model
						, SearchVO searchVO
						, @RequestParam(value="nowPage", defaultValue ="1") Integer nowPage 
						, @RequestParam(value="cntPerPage", defaultValue ="20") Integer cntPerPage) {
		
		int total = noticeService.noticeCount(searchVO);
		PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
		List<NoticeVO> noticeList = noticeService.getNoticeList(pagingVO,searchVO);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("paging", pagingVO);
		
							
		return "notice/noticeList";
		
	}
	
	// 단건 조회
	@GetMapping("/noticeInfo")
	public String getNoticeInfo(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeInfo";
	}
	
	// 등록 폼
	@GetMapping("/noticeInsert")
	public String noticeInsertForm() {
		return "notice/noticeInsert";
	}
	
	// 등록
	@PostMapping("/noticeInsert")
	public String noticeInsert(NoticeVO noticeVO) {
		noticeService.noticeInsert(noticeVO);
		return "redirect:noticeList";
	}

	// 게시글 수정 폼
	@GetMapping("/noticeUpdate")
	public String noticeUpdateForm(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeUpdate";
	}
	
	// 게시글 삭제
	@GetMapping("/noticeDelete")
	public String noticeDelete(@RequestParam(name = "noticeId", defaultValue = "0") int noticeId) {
		noticeService.noticeDelete(noticeId);
		return "redirect:noticeList";
	}
	 
	/* 수정중
	// 좋아요 기능
	@GetMapping("/noticeInfo") public void findLike(int notice_id, String member_id, Model model) { 
	model.addAttribute("findLike", service.findLike(notice_id) );

	ComLikeVO comLike = new ComLikeVO();
	 
	 comeLike.setboard_id(notice_id)
	}*/
	
}
