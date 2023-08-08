package com.worksb.hi.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.worksb.hi.common.UserSha256;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Controller
public class memberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "membership/loginForm";
	}
	
	@GetMapping("/registerForm")
	public String registerForm() {
		return "membership/registerForm";
	}
	
	@PostMapping("/insertMember")
	public String insertMember(MemberVO memberVO) {
		//복호화
		String encryPassword = UserSha256.encrypt(memberVO.getMemberPw());
		memberVO.setMemberPw(encryPassword);
		//DB 등록
		memberService.insertMemberInfo(memberVO);
		
		return "membership/loginForm";
	}
}
