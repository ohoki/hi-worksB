package com.worksb.hi.carpool.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.carpool.service.CarpoolService;
import com.worksb.hi.carpool.service.CarpoolVO;
import com.worksb.hi.comLike.service.ComLikeService;
import com.worksb.hi.comLike.service.ComLikeVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;

@RequestMapping("/member")
@Controller
public class CarpoolController {
	
	@Autowired
	CarpoolService carpoolService;
	
	@Autowired
    ComLikeService comLikeService;
	
	//페이징 전체조회
	@GetMapping("/carpoolList")
	public String carpoolList(Model model
						, SearchVO searchVO
						, HttpSession session
						, @RequestParam(value="nowPage", defaultValue ="1") Integer nowPage 
						, @RequestParam(value="cntPerPage", defaultValue ="15") Integer cntPerPage) {
		
		// 세션의 companyid값 가져오기
		CompanyVO company = (CompanyVO)session.getAttribute("companyInfo");
		Integer companyIdd = company.getCompanyId();
		
		// searchVO에 담아준다
		searchVO.setCompanyId(companyIdd);
		
		int total = carpoolService.carpoolCount(searchVO);
		PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
		int companyId=((CompanyVO)session.getAttribute("companyInfo")).getCompanyId();
		
		List<CarpoolVO> carpoolList = carpoolService.getCarpoolList(pagingVO,searchVO,companyId);
			
		/*
		 * // 각 게시글의 좋아요 갯수를 가져와서 모델에 추가 List<Integer> likeCounts = new ArrayList<>();
		 * for (CarpoolVO carpool : carpoolList) { ComLikeVO comLikeVO = new
		 * ComLikeVO(); comLikeVO.setBoardId(carpool.getBoardId());
		 * comLikeVO.setBoardType("C3"); int likeCount =
		 * comLikeService.countLikes(comLikeVO); likeCounts.add(likeCount); }
		 * 
		 * model.addAttribute("likeCounts", likeCounts); // 좋아요 갯수 리스트를 모델에 추가
		 */		
		model.addAttribute("carpoolList", carpoolList);
		model.addAttribute("paging", pagingVO);
		
							
		return "carpool/carpoolList";	
	}
	
	// 단건 조회
	@GetMapping("/carpoolInfo")
	public String getCarpoolInfo(@RequestParam("boardId")int boardId, HttpSession session, CarpoolVO carpoolVO,Model model, ComLikeVO comLikeVO) {
		if(boardId!=0) {
			carpoolVO.setBoardId(boardId);			
		}
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		
		// 조회수 증가
		carpoolService.carpoolHit(boardId);
		// 게시물 정보 가져오기
		CarpoolVO findVO = carpoolService.getCarpoolInfo(carpoolVO);
		model.addAttribute("carpoolInfo", findVO);
		
		// 좋아요 갯수 가져오기
		// 좋아요 갯수 가져오기
	    comLikeVO.setBoardId(carpoolVO.getBoardId());
	    comLikeVO.setBoardType("C3");
	    model.addAttribute("likeCount", comLikeService.countLikes(comLikeVO));
	    
		//참여자 숫자 불러오기
		model.addAttribute("participantsCounting",carpoolService.getPCount(boardId));
		model.addAttribute("participantList",carpoolService.getApplicantList(boardId));
		model.addAttribute("memberId",memberId);
		
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
	public String carpoolUpdateForm(CarpoolVO carpoolVO, Model model) {
		CarpoolVO findVO = carpoolService.getCarpoolInfo(carpoolVO);
		model.addAttribute("carpoolInfo", findVO);
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
	
	//카풀신청
	@GetMapping("/applyCarpool")
	@ResponseBody
	public CarpoolVO countParticipants(@RequestParam("boardId")int boardId, HttpSession session) {	
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		
		CarpoolVO vo=new CarpoolVO();
		vo.setBoardId(boardId);
		vo.setMemberId(memberId);
		vo.setApplicant(carpoolService.applyCarpool(vo));
		vo.setMemberName(carpoolService.getApplicantName(memberId));
		return vo;
	}
	
	//카풀신청취소
	@GetMapping("/cancelCarpool")
	@ResponseBody
	public CarpoolVO cancel(@RequestParam("boardId")int boardId, HttpSession session) {
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();

		CarpoolVO vo=new CarpoolVO();
		vo.setBoardId(boardId);
		vo.setMemberId(memberId);
		vo.setMemberName(carpoolService.getApplicantName(memberId));
		if(carpoolService.cancelCarpool(boardId)>0) {	
			return vo;
		}
		return null;
	}
}
