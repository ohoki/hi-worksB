package com.worksb.hi.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.worksb.hi.common.UserSha256;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Controller
public class memberController {
	
	@Autowired
	MemberService memberService;
	
	//로그인 폼 이동
	@GetMapping("/loginForm")
	public String loginForm() {
		return "membership/loginForm";
	}//로그인 폼 이동 종료
	
	//회원가입 폼 이동
	@GetMapping("/registerForm")
	public String registerForm() {
		return "membership/registerForm";
	}//회원가입 폼 이동 종료
	
	//단건조회
	@GetMapping("/selectMember")
	public String selectMember(MemberVO memberVO, Model model) {
		String result = "no";
		
		memberVO = memberService.selectMember(memberVO);
		
		if(memberVO != null) {
			result = "yes";
		}
		
		model.addAttribute(result);
		return "membership/registerForm";
	}
	
	//회원 등록
	@PostMapping("/insertMember")
	public String insertMember(MemberVO memberVO) {
		//복호화
		String encryPassword = UserSha256.encrypt(memberVO.getMemberPw());
		memberVO.setMemberPw(encryPassword);
		//DB 등록
		memberService.insertMemberInfo(memberVO);
		
		return "membership/loginForm";
	}//회원 등록 종료
	
	
}
