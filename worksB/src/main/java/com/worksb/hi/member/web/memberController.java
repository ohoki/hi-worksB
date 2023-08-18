package com.worksb.hi.member.web;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.common.UserSha256;
import com.worksb.hi.company.service.CompanyService;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Controller
public class memberController {

	@Autowired
	MemberService memberService;
	@Autowired
	CompanyService companyService;

	@GetMapping("/selectMember")
	@ResponseBody
	public int selectMember(MemberVO memberVO) {
		int result = 0;

		memberVO = memberService.selectMember(memberVO);

		if (memberVO == null) { // 아이디 사용가능
			result = 1;
		}
		return result;
	}// selectMember

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}//loginForm
	
	
//========== 서비스 시작하기 ===============
	@GetMapping("/start")
	public String start(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String cookieMemberId = null;
		MemberVO member = new MemberVO();
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
		CompanyVO company = new CompanyVO();
		
		//쿠키값 가져오기
		for(Cookie c : cookies) {
			if(c.getName().equals("memberId")) {
				cookieMemberId = c.getValue();
			}
		}
		
		if(cookieMemberId == null && sessionMember == null) { // 둘 다 null
			return "redirect:/loginForm";
		}
		
		//둘 중 하나라도 null이 아니라면 해당 회원 찾아오기
		member.setMemberId(cookieMemberId != null ? cookieMemberId : sessionMember.getMemberId());
		member = memberService.selectMember(member);
	
		if(member.getCompanyId() == null) { // 회사가 등록되지 않은 회원
			session.setAttribute("memberInfo", member);
			return "member/practiceCompany";
		} else { // 회사가 등록된 회원
			//회사 승인 여부
			if("A2".equals(member.getCompanyAccp()) || member.getCompanyAccp() == null) { // 승인 NO
				session.setAttribute("memberInfo", member);
				return "member/accpWait";
			}else { // 승인 YES
				//해당 회사 정보 가져오기
				company.setCompanyId(member.getCompanyId());
				company = companyService.getCompanyById(company);
				//세션 저장
				session.setAttribute("memberInfo", member);
				session.setAttribute("companyInfo", company);
				return "company/companyMain";
			} 
		}
	}//start
		
//	======== 이메일 인증 및 회원 가입 ===============
	@GetMapping("/registerForm")
	public String registerForm() {
		return "member/registerForm";
	}// registerForm

	@PostMapping("/insertMember")
	public String insertMember(MemberVO memberVO, Model model) throws Exception {
		int result = 0;
		String message = null;
		// 복호화
		String encryPassword = UserSha256.encrypt(memberVO.getMemberPw());
		memberVO.setMemberPw(encryPassword);
		// DB 등록
		result = memberService.insertMemberInfo(memberVO);

		// 정상 등록 여부 확인
		if (result == 1) {
			message = "정상 등록되었습니다. 이메일 인증 후 로그인이 가능합니다.";
		} else if (result == 0) {
			message = "회원 정보 등록에 실패하셨습니다.";
		}

		model.addAttribute("message", message);

		return "member/loginForm";
	}// insertMember

	@GetMapping("/registerEmail")
	public String emailConfirm(MemberVO memberVo, Model model) {
		int result = 0;
		String message = null;

		result = memberService.updateMailAuth(memberVo);

		if (result == 1) {
			message = "인증이 완료되었습니다.";
		} else {
			message = "인증에 실패했습니다.";
		}

		model.addAttribute("message", message);
		return "member/emailAuthSuccess";
	}// emailConfirm

//================== 회원 정보 수정 =================================
	@GetMapping("member/updateForm")
	public String updateForm() {
		return "company/updateForm";
	}
	
//========== 회사 등록 ==================
	@GetMapping("/member/companyRegisterForm")
	public String companyRegisterForm() {
		return "member/companyRegisterForm";
	}
}
