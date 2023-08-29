package com.worksb.hi.search.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.worksb.hi.common.SearchVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.search.service.SearchService;
import com.worksb.hi.search.service.SearchingVO;

@Controller
public class SearchController {
	@Autowired
	SearchService service;
	
	@GetMapping("/searchboard")
	public String Search
	(SearchVO searchvo,HttpSession session,Model m,
	 @RequestParam("searchkeyword") String searchKeyword,
	 @RequestParam("searchBoardType") String boardType
			) {
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		int companyId=((CompanyVO)session.getAttribute("companyInfo")).getCompanyId();
		
		if(boardType.equals("1")) {
			m.addAttribute("prjList",service.getAllPrj(memberId,companyId,searchKeyword));
			m.addAttribute("searchkeyword",searchKeyword);
			m.addAttribute("boardType", 1);
			return "search/result";
		}else if(boardType.equals("2")) {
			//동호회목록(내가참여한 동호회)
			m.addAttribute("clubList",service.getAllClub(memberId, searchKeyword));
			//공지사항목록(회사별)
			m.addAttribute("noticeList",service.getAllNotice(companyId, searchKeyword));
			//카풀목록(회사별):departuredate칼럼에 이상한 값들어와서 일단은 패쑤
			m.addAttribute("carpoolList",service.getAllCarpool(companyId, searchKeyword));
			m.addAttribute("searchkeyword",searchKeyword);
			m.addAttribute("boardType", 2);
			return "search/result";
		}else {
			//프로젝트존
			m.addAttribute("prjList",service.getAllPrj(memberId,companyId,searchKeyword));
			//공통필요
			m.addAttribute("searchkeyword",searchKeyword);
			m.addAttribute("boardType", 3);
			
			//동호회목록(내가참여한 동호회)
			m.addAttribute("clubList",service.getAllClub(memberId, searchKeyword));
			//공지사항목록(회사별)
			m.addAttribute("noticeList",service.getAllNotice(companyId, searchKeyword));
			//카풀목록(회사별):departuredate칼럼에 이상한 값들어와서 일단은 패쑤
			m.addAttribute("carpoolList",service.getAllCarpool(companyId, searchKeyword));
			
			return "search/result";
		}
	}
	@RequestMapping("/searchByDate")
	public String searchByDate(HttpSession session,Model m,SearchingVO vo,
			 @RequestParam("searchkeyword") String searchKeyword,
			 @RequestParam("searchBoardType") String boardType,
			 @RequestParam("startDate")String startDate,
			 @RequestParam("endDate")String endDate) {
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		int companyId=((CompanyVO)session.getAttribute("companyInfo")).getCompanyId();
		vo.setMemberId(memberId);
		vo.setCompanyId(companyId);
		vo.setSearchKeyword(searchKeyword);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		
		
		if(boardType.equals("1")) {
			m.addAttribute("searchkeyword",searchKeyword);
			m.addAttribute("boardType", 1);
			m.addAttribute("prjList",service.getPrj(vo));
			
			return "search/result";
		}else if(boardType.equals("2")) {
			m.addAttribute("searchkeyword",searchKeyword);
			m.addAttribute("boardType", 2);
			//동호회목록(내가참여한 동호회)
			m.addAttribute("clubList",service.getClub(vo));
			//공지사항목록(회사별)
			m.addAttribute("noticeList",service.getNotice(vo));
			//카풀목록(회사별):departuredate칼럼에 이상한 값들어와서 일단은 패쑤
			//m.addAttribute("carpoolList",service. getCarpool(vo));
			
			return "search/result";
		}
		else {
			m.addAttribute("searchkeyword",searchKeyword);
			m.addAttribute("boardType", 3);
			
			//프로젝트
			m.addAttribute("prjList",service.getPrj(vo));
			
			//동호회목록(내가참여한 동호회)
			m.addAttribute("clubList",service.getClub(vo));
			//공지사항목록(회사별)
			m.addAttribute("noticeList",service.getNotice(vo));
			//카풀목록(회사별):departuredate칼럼에 이상한 값들어와서 일단은 패쑤
			//m.addAttribute("carpoolList",service. getCarpool(vo));
			return "search/result";
		}
	}
}
