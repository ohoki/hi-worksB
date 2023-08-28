package com.worksb.hi.search.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.worksb.hi.common.SearchVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.search.service.SearchService;

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
			return "search/result";
		}else if(boardType.equals("2")) {
			System.out.println("사내게시판");
			
			return "search/result";
		}else {
			System.out.println("whole");
			
			return "search/result";
		}
	}
}
