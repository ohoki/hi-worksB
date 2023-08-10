package com.worksb.hi.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.common.UserSha256;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Controller
public class memberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/selectMember")
	@ResponseBody
	public String selectMember(MemberVO memberVO) {
		String result = "no";
		
		memberVO = memberService.selectMember(memberVO);
		
		if(memberVO == null) { // 아이디 중복 X -> 아이디 사용가능
			result = "yes";
		}
		return result;
	}//selectMember
	
// ========== 로그인 & 로그아웃 =====================	
	@GetMapping("/loginForm")
	public String loginForm(String memberId, String companyId, HttpSession session) {
		
		if(memberId == null || memberId == "") { //자동로그인 x
			return "member/loginForm";
		}
		
		//자동로그인 시 세션 등록
		session.setAttribute("memberId", memberId);
		session.setAttribute("companyId", companyId);
		
		if(companyId == null || companyId == "") { // 등록된 회사 x
			return "member/practiceCompany";
		} else {
			return "company/companyMain";
		}
	}//loginForm
	
	@PostMapping("loginMember")
	public String login(MemberVO memberVO, boolean autoLogin, Model model, HttpServletResponse response, HttpSession session) {
		String message = null;
		
		//아이디 확인
		MemberVO dbMember = memberService.selectMember(memberVO);
		if(dbMember == null) {
			message = "해당 아이디는 회원이 아닙니다.";
			model.addAttribute("message",message);
			return "member/loginForm";
		}
		
		//이메일 인증 확인
		if(dbMember.getMailAuth() == 0) {
			message = "이메일 인증 후 로그인이 가능합니다.";
			model.addAttribute("message",message);
			return "member/loginForm";
		}
				
		//비밀번호 확인
		String inputPw = UserSha256.encrypt(memberVO.getMemberPw());
		
		if(!dbMember.getMemberPw().equals(inputPw)) {
			message = "비밀번호를 다시 입력해주세요.";
			model.addAttribute("message",message);
			return "member/loginForm";
		}
		
		//자동로그인 여부
		if(autoLogin == true) {
			//쿠키등록
			Cookie idCookie = new Cookie("memberId", memberVO.getMemberId());
			idCookie.setMaxAge(60*60*24*7); //쿠키 수명
			idCookie.setPath("/"); //모든 경로에 적용
			
			Cookie companyCookie = new Cookie("companyId", String.valueOf(dbMember.getCompanyId()));
			companyCookie.setMaxAge(60*60*24*7);
			companyCookie.setPath("/");
			
			response.addCookie(idCookie);
			response.addCookie(companyCookie);
		}

		//세션등록
		session.setAttribute("memberId", memberVO.getMemberId());
		session.setAttribute("companyId", memberVO.getCompanyId());
		
		message = "정상적으로 로그인되었습니다.";
		model.addAttribute("message",message);
		
		//등록된 회사 존재 여부
		if(memberVO.getCompanyId() == null) {
			return "member/practiceCompany";
		}else {
			return "company/companyMain";
		}
	}//login
	
	@GetMapping("logout")
	public String logout(String memberId, HttpServletResponse response, Model model, HttpSession session) {
		String message = null;
		
		try {
			//쿠키 삭제
			Cookie idCookie = new Cookie("memberId", null);
			idCookie.setMaxAge(0); //쿠키 수명
			idCookie.setPath("/"); //모든 경로에 적용
			
			Cookie companyCookie = new Cookie("companyId", null);
			companyCookie.setMaxAge(0);
			companyCookie.setPath("/");
			
			response.addCookie(idCookie);
			response.addCookie(companyCookie);
			
			//세션 삭제
			session.invalidate();
			
			message = "정상적으로 로그아웃 되었습니다.";
		}catch (Exception e) {
			message = "로그아웃에 실패했습니다.";
		}
		
		model.addAttribute("message", message);
		return "member/loginForm";
	}
	
	
//	======== 이메일 인증 및 회원 가입 ===============
	@GetMapping("/registerForm")
	public String registerForm() {
		return "member/registerForm";
	}//registerForm
	
	@PostMapping("/insertMember")
	public String insertMember(MemberVO memberVO, Model model) throws Exception {
		int result = 0;
		String message = null;
		//복호화
		String encryPassword = UserSha256.encrypt(memberVO.getMemberPw());
		memberVO.setMemberPw(encryPassword);
		//DB 등록
		result = memberService.insertMemberInfo(memberVO);
		
		//정상 등록 여부 확인
		if(result == 1) {
			message = "정상 등록되었습니다. 이메일 인증 후 로그인이 가능합니다.";
		} else if (result == 0) {
			message = "회원 정보 등록에 실패하셨습니다.";
		}
		
		model.addAttribute("message", message);
		
		return "member/loginForm";
	}//insertMember
	
	@GetMapping("/registerEmail")
	public String emailConfirm(MemberVO memberVo, Model model) {
		int result = 0;
		String message = null;
		
		result = memberService.updateMailAuth(memberVo);
		
		if(result == 1) {
			message = "인증이 완료되었습니다.";
		}else {
			message = "인증에 실패했습니다.";
		}
		
		model.addAttribute("message", message);
 		return "member/emailAuthSuccess";
	}//emailConfirm
	
//========== 회사 등록 ==================
	@GetMapping("companyRegisterForm")
	public String companyRegisterForm() {
		return "member/companyRegisterForm";
	}
}
