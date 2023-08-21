package com.worksb.hi.project.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.project.service.DeptVO;
import com.worksb.hi.project.service.PrjParticirVO;
import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;

// 주현  :  즐겨찾기, 프로젝트 리스트 출력(개별, 회사별)
// 이진 프로젝트 관리 - 등록, 수정, 삭제
@Controller
public class ProjectController {
	
	@Autowired
	//이진
	ProjectService projectService;
	
	
	//주현
	
	
	
	
	//이진 - 등록수정삭제
	//프로젝트 등록 폼
	@GetMapping("/projectInsert")
	public String projectInsertForm(HttpSession session, Model model) {

		// 소속 회사의 부서정보 받아오기
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		int companyId = member.getCompanyId();
		List<DeptVO> department = projectService.getDeptInfo(companyId);
		model.addAttribute("department", department);
		
		return "projectForm/projectInsert";
	}
	
	//프로젝트 등록
	@PostMapping("/projectInsert")
	public String projectInsertProcess(ProjectVO projectVO, HttpSession session) {
		
		//A1 : Yes, A2 : No
		projectVO.setProjectAccess(projectVO.getProjectAccess()!=null ? "A1" : "A2");
		projectVO.setManagerAccp(projectVO.getManagerAccp()!=null? "A1" : "A2");
		
		// 부서 정보
		// 프로젝트명 = 부서이름 + 프로젝트명
		int deptId = projectVO.getDeptId();
	    DeptVO department = projectService.getDeptInfoByDeptId(deptId);
	    String newName = "[" + department.getDeptName() + "]" + projectVO.getProjectName();
	    projectVO.setProjectName(newName);
	    
	    // 프로젝트 등록
	    projectService.insertProject(projectVO);

	    // 멤버 정보
	    MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		String memberId = member.getMemberId();
		
		PrjParticirVO participant = new PrjParticirVO();
		participant.setMemberId(memberId);
		
		// 관리자 여부 A1 : YES
		// 프로젝트 등록자 -> 관리자
		participant.setManager("A1");
		// 참여 승인 여부
		participant.setParticirAccp("A1");
		participant.setProjectId(projectVO.getProjectId());
		
		// 참여자 등록
		projectService.insertParticipant(participant);
		
		return "redirect:/projectFeed?projectId=" + projectVO.getProjectId();
	}
	
	//프로젝트 수정폼
	@GetMapping("/projectUpdate")
	public String projectUpdateForm(@RequestParam int projectId, Model model, HttpSession session) {
		//기존 프로젝트 정보 가져오기
	    ProjectVO projectInfo = projectService.getProjectInfo(projectId);
	    
	    model.addAttribute("projectInfo", projectInfo);
	    
	    // 프로젝트 이름 -> 부서명 잘라내기
	    String projectName = projectInfo.getProjectName();
	    String realProjectName = projectName.substring(projectName.indexOf("]") + 1);
	    model.addAttribute("realProjectName", realProjectName);
	    
	    // 부서 정보
	    MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		int companyId = member.getCompanyId();
		List<DeptVO> departments = projectService.getDeptInfo(companyId);
		model.addAttribute("departments", departments);
		   
	    
	    return "projectForm/projectUpdate";
	}
	
	//프로젝트 수정
	@PostMapping("/projectUpdate")
	public String projectUpdate(ProjectVO projectVO) {
		
		//A1 : Yes, A2 : No
		projectVO.setProjectAccess("on".equals(projectVO.getProjectAccess())? "A1" : "A2");
		projectVO.setManagerAccp("on".equals(projectVO.getManagerAccp())? "A1" : "A2");
		
		// 부서 정보
		// 프로젝트명 = 부서이름 + 프로젝트명
		int deptId = projectVO.getDeptId();
	    DeptVO department = projectService.getDeptInfoByDeptId(deptId);
	    String newName = "[" + department.getDeptName() + "]" + projectVO.getProjectName();
	    projectVO.setProjectName(newName);
		
		projectService.updateProject(projectVO);

		return "redirect:/projectFeed?projectId=" + projectVO.getProjectId();
	}

	// 프로젝트 삭제
	@GetMapping("/projectDelete")
	public String projectDelete(@RequestParam int projectId) {
		projectService.deleteProject(projectId);
		return "redirect:/home"; // 리턴 페이지 수정해야함!! -> 프로젝트 리스트
	}
	
	// 프로젝트 피드
	@GetMapping("/projectFeed")
    public String projectFeed(@RequestParam int projectId, Model model) {
        ProjectVO projectInfo = projectService.getProjectInfo(projectId);
         
        model.addAttribute("projectInfo", projectInfo);

        return "project/projectFeed";
    }
	
	
	
	
	
	
	
	
	
	//주현
	
	//회사 전체 프로젝트출력
	@GetMapping("/SelectFromCompany")
	public String SelectCom(Model m,HttpSession session) {
		Integer companyId=((CompanyVO)session.getAttribute("companyInfo")).getCompanyId();
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		m.addAttribute("projectList",projectService.selectFromCompany(companyId,memberId));
		m.addAttribute("memberId", memberId);
		return "prj/selectFromCompany";
	}
	
	
	
	//개인 프로젝트리스트출력(리스트형식)
	@GetMapping("/projectList")
	public String projectList(Model m,HttpSession session) {
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		m.addAttribute("projectList",projectService.searchPrj(memberId));
		return"prj/projectList";
	}
	
	//개인 프로젝트리스트출력(그리드형식)
	@GetMapping("/projectGrid")
	public String projectGrid(Model m,HttpSession session) {
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		m.addAttribute("projectList",projectService.searchPrj(memberId));
		return"prj/projectGrid";
	}
	
	
	//즐겨찾기갱신
	@PostMapping("/updateStar")
	@ResponseBody
	public String removeStar(@RequestBody ProjectVO starInfo,HttpSession session) {
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		starInfo.setMemberId(memberId);
		
		projectService.updateStar(starInfo);
		return"ok";
	}
}
