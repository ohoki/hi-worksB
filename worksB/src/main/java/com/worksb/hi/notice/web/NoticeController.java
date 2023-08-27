package com.worksb.hi.notice.web;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.comLike.service.ComLikeService;
import com.worksb.hi.comLike.service.ComLikeVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
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
	@GetMapping("noticeList")
	public String noticeList(Model model
						, SearchVO searchVO
						, @RequestParam(value="nowPage", defaultValue ="1") Integer nowPage 
						, @RequestParam(value="cntPerPage", defaultValue ="10") Integer cntPerPage) {
		
		int total = noticeService.noticeCount(searchVO);
		PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
		List<NoticeVO> noticeList = noticeService.getNoticeList(pagingVO,searchVO);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("paging", pagingVO);
							
		return "notice/noticeList";
		
	}
	
	@GetMapping("/noticeInfo")
	public String getNoticeInfo(@RequestParam("noticeId") int noticeId, Model model) {
	    NoticeVO noticeVO = new NoticeVO();
	    noticeVO.setNoticeId(noticeId);

	    // 조회수 증가
	    noticeService.noticeHit(noticeId);

	    // 공지 정보 가져오기
	    NoticeVO findVO = noticeService.getNoticeInfo(noticeVO); // 수정된 부분
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
	
	//게시글 수정
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO){
		noticeService.noticeUpdate(noticeVO);
		return "redirect:noticeList";
	}
	
	// 게시글 삭제
	@GetMapping("/noticeDelete")
	public String noticeDelete(@RequestParam(name = "noticeId", defaultValue = "0") int noticeId) {
		noticeService.noticeDelete(noticeId);
		return "redirect:noticeList";
	}
	
	// 좋아요 여부 확인
    @GetMapping("/like")
    @ResponseBody
    public String like(@RequestParam("boardType") String boardType, @RequestParam("boardId") int boardId, @RequestParam("memberId") String memberId) {
        ComLikeVO comLikeVO = new ComLikeVO();
        comLikeVO.setBoardType(boardType);
        comLikeVO.setBoardId(boardId);
        comLikeVO.setMemberId(memberId);
        
        // 좋아요 눌렀는지 확인
        if (comLikeService.checkLiked(comLikeVO)) {
        	// 좋아요 누른 상태면 해제
            comLikeService.deleteLike(comLikeVO);
            return "unliked";
        } else {
        	// 안눌렀으면 좋아요 등록
            comLikeService.insertLike(comLikeVO);
            return "liked";
        }
    }
    
    // 좋아요 수 조회
    @GetMapping("/countLikes")
    @ResponseBody
    public int countLikes(@RequestParam("boardType") String boardType, @RequestParam("boardId") int boardId) {
        ComLikeVO comLikeVO = new ComLikeVO();
        comLikeVO.setBoardType(boardType);
        comLikeVO.setBoardId(boardId);
        return comLikeService.countLikes(comLikeVO);
    }
	
    // 공지마다 좋아요
    @GetMapping("/noticeLikeCount")
    @ResponseBody
    public int getLikeCountForNotice(@RequestParam("noticeId") int noticeId) {
        // 해당 공지마다의 좋아요 총 갯수 조회
        return comLikeService.noticeLikeCount(noticeId);
    }
}
