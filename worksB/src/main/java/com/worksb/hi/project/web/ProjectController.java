package com.worksb.hi.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;

//이진 프로젝트 관리 - 등록, 수정, 삭제

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

		//해당 회사의 부서이름 받아와야함!!
		// companyId -> departmentId, departmentName 
		
		return "projectForm/projectInsert";
	}
	
	//프로젝트 등록
	@PostMapping("/projectInsert")
	public String projectInsertProcess(ProjectVO projectVO, HttpSession session) {
		
		//A1 : Yes, A2 : No
		projectVO.setProjectAccess(projectVO.getProjectAccess()!=null ? "A1" : "A2");
		projectVO.setManagerAccp(projectVO.getManagerAccp()!=null? "A1" : "A2");
		
		// 부서번호 -> 부서이름 !!!
		
		// 프로젝트명 = 부서이름 + 프로젝트명
//		projectVO.setProjectName(departmentName + "_" + projectVO.getProjectName());
		
		String memberId = (String) session.getAttribute("memberId");
		
		projectVO.setMemberId(memberId);
		projectService.insertProject(projectVO);
		
	    
		return "redirect:/projectFeed?projectId=" + projectVO.getProjectId();
	}
	
	//프로젝트 수정폼
	@GetMapping("/projectUpdate")
	public String projectUpdateForm(@RequestParam int projectId, Model model) {
	    ProjectVO projectInfo = projectService.getProjectInfo(projectId);
	    
	    model.addAttribute("projectInfo", projectInfo);
	    //부서번호 -> 부서이름 추가해야함
	    
	    return "projectForm/projectUpdate";
	}
	
	//프로젝트 수정
	@PostMapping("/projectUpdate")
	public String projectUpdate(ProjectVO projectVO) {
		
		//A1 : Yes, A2 : No
		projectVO.setProjectAccess("on".equals(projectVO.getProjectAccess())? "A1" : "A2");
		projectVO.setManagerAccp("on".equals(projectVO.getManagerAccp())? "A1" : "A2");
		
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
	@GetMapping("/projectList")
	public String projectList(Model m,HttpSession session) {
		String companyId = (String) session.getAttribute("companyId");
		
		m.addAttribute("projectList",projectService.searchPrj(companyId));
		return"prj/projectList";
	}
}
