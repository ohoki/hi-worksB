
package com.worksb.hi.member.web;


import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.common.UserSha256;
import com.worksb.hi.company.service.CompanyService;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.company.service.DepartmentVO;
import com.worksb.hi.company.service.JobVO;
import com.worksb.hi.company.web.CompanyController;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Controller
public class memberController {
	
	@Value("${file.upload.path}")
	private String uploadPath;
	
	@Autowired
	MemberService memberService;
	@Autowired
	CompanyService companyService;
	
	@Autowired
	CompanyController cc;
	
	@GetMapping("/member/memberList")
	@ResponseBody
	public List<MemberVO> getMemberList(MemberVO memberVO) {
		System.out.println("====================" + memberVO);
		return memberService.getMemberListByCompany(memberVO);
	}
	
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
	
	//회원 단건 조회
	@GetMapping("/member/getMember")
	@ResponseBody
	public MemberVO getMember(MemberVO memberVO) {
		return memberService.selectMember(memberVO);
	}// getMember
	
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
				
				List<MemberVO> projectList= memberService.getProjectList(member);
				model.addAttribute("projectList", projectList);
				List<MemberVO> noticeList= memberService.getNoticeList(member);
				model.addAttribute("noticeList", noticeList);
				
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
	public String updateForm(HttpSession session, Model model) {
		CompanyVO company = (CompanyVO)session.getAttribute("companyInfo");
		
		//부서, 직급 정보 가져오기
		List<DepartmentVO> deptList = companyService.getDepartment(company);
		List<JobVO> jobList = companyService.getJob(company);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("jobList", jobList);
		return "company/updateForm";
	}//updateForm
	
	@RequestMapping("member/updateMember")
	@ResponseBody
	public boolean updateMember(MemberVO memberVO, HttpSession session) {
		//비밀번호가 수정됐다면 암호화
		if(memberVO.getMemberPw() != null) {
			memberVO.setMemberPw(UserSha256.encrypt(memberVO.getMemberPw()));
		}
		
		int result = memberService.updateMember(memberVO);
		
		if(result == 0) {
			return false;
		}
		
		MemberVO updatedMember = memberService.selectMember(memberVO);
		session.setAttribute("memberInfo", updatedMember);
		return true;
	}//updateMember
	
	//프로필 사진 수정
	@PostMapping("/member/updateProfile")
	@ResponseBody
	public boolean updateProfile(MemberVO memberVO, @RequestPart MultipartFile image, HttpSession session) {
		MemberVO dbMember = memberService.selectMember(memberVO);
		
		if(dbMember != null) {
			String originalName = image.getOriginalFilename();	
			String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
			String folderPath = cc.makeFolder();
			String uuid = UUID.randomUUID().toString();
			String uploadFileName = folderPath + File.separator + uuid + "_" + fileName;
			String saveName = uploadPath + File.separator + uploadFileName;
			Path savePath = Paths.get(saveName);
			
			//로컬에 이미지 저장
			try {
				image.transferTo(savePath);
			} catch (Exception e) {
				return false;
			}
			//DB 저장
			memberVO.setProfilePath(fileName);
			memberVO.setRealProfilePath(cc.setImagePath(uploadFileName));
			
			int result = memberService.updateMember(memberVO);
			
			if(result == 0) {
				return false;
			}
			
			//수정된 db정보 불러오기
			dbMember = memberService.selectMember(memberVO);
			session.setAttribute("memberInfo", dbMember);
			return true;
		} 
		return false;
	}//updateProfile
	
	//패스워드 변경 페이지
	@GetMapping("/member/updatePwForm")
	public String updatePwForm() {
		return "company/updatePwForm";
	}//updatePwForm
	
	//패스워드 확인
	@PostMapping("/member/pwCheck")
	@ResponseBody
	public boolean pwCheck(HttpSession session, String memberPw) {
		String oldPw = UserSha256.encrypt(memberPw);
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
		
		if(oldPw.equals(sessionMember.getMemberPw())) {
			return true;
		}
		return false;
	}//pwCheck
	
//========== 회사 등록 ==================
	@GetMapping("/member/companyRegisterForm")
	public String companyRegisterForm() {
		return "member/companyRegisterForm";
	}//companyRegisterForm
}
