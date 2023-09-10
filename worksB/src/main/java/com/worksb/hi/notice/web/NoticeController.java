package com.worksb.hi.notice.web;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.boardCmt.service.BoardCmtService;

import com.worksb.hi.comLike.service.ComLikeService;
import com.worksb.hi.comLike.service.ComLikeVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.notice.service.NoticeService;
import com.worksb.hi.notice.service.NoticeVO;

// 2023.08.18 이동민 공지사항
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
    @Autowired
    ComLikeService comLikeService;
	
	//페이징 전체조회
	@GetMapping("/member/noticeList")
	public String noticeList(Model model
						, SearchVO searchVO
						, @RequestParam(value="nowPage", defaultValue ="1") Integer nowPage 
						, @RequestParam(value="cntPerPage", defaultValue ="15") Integer cntPerPage, HttpSession session) {
		
	    // 세션의 companyid값 가져오기
		CompanyVO company = (CompanyVO)session.getAttribute("companyInfo");
		Integer companyId = company.getCompanyId();
		// searchVO에 담아준다
		searchVO.setCompanyId(companyId);
		
		int total = noticeService.noticeCount(searchVO);
		PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
		
		List<NoticeVO> noticeList = noticeService.getNoticeList(pagingVO, searchVO); //추가된 부분
		//List<NoticeVO> noticeList = noticeService.getNoticeList(pagingVO,searchVO);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("paging", pagingVO);
							
		return "notice/noticeList";
	}
	
	// 상세보기
	@GetMapping("/member/noticeInfo")
	public String getNoticeInfo(NoticeVO noticeVO, ComLikeVO comLikeVO, Model model, HttpSession session,
								@RequestParam("noticeId")int noticeId) {
	    
		// 조회수 증가
		noticeService.noticeHit(noticeId);


	    // 공지 정보 가져오기
	    NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
	    model.addAttribute("noticeInfo", findVO);
	    
	    // 좋아요 갯수 가져오기
	    comLikeVO.setBoardId(noticeVO.getNoticeId());
	    comLikeVO.setBoardType("C2");
	    model.addAttribute("likeCount", comLikeService.countLikes(comLikeVO));
	    
	    // 세션의 id값 가져오기
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		String memberId = member.getMemberId();
        comLikeVO.setMemberId(memberId);
        
        //좋아요
	    model.addAttribute("checkLike",comLikeService.checkLiked(comLikeVO));
	    return "notice/noticeInfo";
	}
	
	// 등록 폼
	@GetMapping("/admin/noticeInsert")
	public String noticeInsertForm() {
		return "notice/noticeInsert";
	}
	
	// 등록
	@PostMapping("/admin/noticeInsert")
	public String noticeInsert(NoticeVO noticeVO, HttpServletRequest request) {
		noticeService.noticeInsert(noticeVO);
		return "redirect:/member/noticeList";
	}

	// 게시글 수정 폼
	@GetMapping("/admin/noticeUpdate")
	public String noticeUpdateForm(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeUpdate";
	}
	
	//게시글 수정
	@PostMapping("/admin/noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO){
		noticeService.noticeUpdate(noticeVO);
		return "redirect:/member/noticeList";
	}
	
	// 게시글 삭제
	@GetMapping("/admin/noticeDelete")
	public String noticeDelete(@RequestParam(name = "noticeId", defaultValue = "0") int noticeId) {
		noticeService.noticeDelete(noticeId);
		return "redirect:/member/noticeList";
	}
	
	// 좋아요 여부 확인
    @GetMapping("/member/like")
    @ResponseBody
    public  Map<String, Object> like(ComLikeVO comLikeVO ) {
        Map<String, Object> map = new HashMap<>();
        
        // 좋아요 눌렀는지 확인
        if (comLikeService.checkLiked(comLikeVO)) {
        	// 좋아요 누른 상태면 해제
            comLikeService.deleteLike(comLikeVO);
            map.put("result", "unliked");
        } else {
        	// 안눌렀으면 좋아요 등록
            comLikeService.insertLike(comLikeVO);
            map.put("result", "liked");
        }
        map.put("count", comLikeService.countLikes(comLikeVO));
        return map;
    }
}
