package com.worksb.hi.carpool.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.worksb.hi.carpool.service.CarpoolService;
import com.worksb.hi.carpool.service.CarpoolVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
// 2023.08.21 카풀 게시판 이동민
import com.worksb.hi.notice.service.NoticeVO;

@Controller
public class CarpoolController {
	
	@Autowired
	CarpoolService carpoolService;
	
	//페이징 전체조회
	@GetMapping("/carpoolList")
	public String carpoolList(Model model
						, SearchVO searchVO
						, @RequestParam(value="nowPage", defaultValue ="1") Integer nowPage 
						, @RequestParam(value="cntPerPage", defaultValue ="15") Integer cntPerPage) {
		
		int total = carpoolService.carpoolCount(searchVO);
		PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
		List<CarpoolVO> carpoolList = carpoolService.getCarpoolList(pagingVO,searchVO);
		
		model.addAttribute("carpoolList", carpoolList);
		model.addAttribute("paging", pagingVO);
		
							
		return "carpool/carpoolList";	
	}
	
	// 단건 조회
	@GetMapping("/carpoolInfo")
	public String getCarpoolInfo(CarpoolVO carpoolVO, Model model) {
		CarpoolVO findVO = carpoolService.getCarpoolInfo(carpoolVO);
		model.addAttribute("carpoolInfo", findVO);
		return "carpool/carpoolInfo";
	}
	
	// 등록 폼
	@GetMapping("/carpoolInsert")
	public String carpoolInsertForm() {
		return "carpool/carpoolInsert";
	}
	
	// 등록
	@PostMapping("/carpoolInsert")
	public String carpoolInsert(CarpoolVO carpoolVO) {
		carpoolService.carpoolInsert(carpoolVO);
		return "redirect:carpoolList";
	}
	
	// 수정 폼
	@GetMapping("/carpoolUpdate")
	public String carpoolUpdateForm() {
		return "carpool/carpoolUpdate";
	}
	
	// 수정
	@PostMapping("/carpoolUpdate")
	public String carpoolUpdate(CarpoolVO carpoolVO) {
		carpoolService.carpoolUpdate(carpoolVO);
		return "redirect:carpoolList";
	}
	
	//삭제
	// 게시글 삭제
	@GetMapping("/carpoolDelete")
	public String carpoolDelete(@RequestParam(name = "boardId", defaultValue = "0") int boardId) {
		carpoolService.carpoolDelete(boardId);
		return "redirect:carpoolList";
	}
}
