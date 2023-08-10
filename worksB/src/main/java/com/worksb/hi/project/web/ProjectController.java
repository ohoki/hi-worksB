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

@Controller
public class ProjectController {
	@Autowired
	//이진
	ProjectService projectService;
	
	
	//주현
	
	
	
	
	//이진
	//프로젝트 등록 폼
	@GetMapping("/projectInsert")
	public String projectInsertForm(HttpSession session, Model model) {

		String memberId = (String) session.getAttribute("memberId");

		//해당 회사의 부서이름 받아와야함!!
		// companyId -> departmentId, departmentName 
		
		return "projectForm/projectInsert";
	}
	
	//프로젝트 등록
	@PostMapping("/projectInsert")
	public String projectInsertProcess(ProjectVO projectVO, HttpSession session) {
		if("on".equals(projectVO.getProjectAccess())){
			// A1 : Yes
			projectVO.setProjectAccess("A1");
		}else {
			// A2 : No
			projectVO.setProjectAccess("A2");
		}
		
		if("on".equals(projectVO.getManagerAccp())) {
			projectVO.setManagerAccp("A1");
		}else {
			projectVO.setManagerAccp("A2");
		}
		
		// 부서번호 -> 부서이름 !!!
		
		// 프로젝트명 = 부서이름 + 프로젝트명
//		projectVO.setProjectName(departmentName + "_" + projectVO.getProjectName());
		
		String memberId = (String) session.getAttribute("memberId");
		
		
		projectService.insertProject(projectVO);
		
	    
		return "home"; //리턴페이지 수정해야됨!!
	}
	
	//프로젝트 수정폼
	@GetMapping("/projectUpdate")
	public String projectUpdateForm(@RequestParam(name = "projectId") int projectId, Model model) {
	    ProjectVO projectInfo = projectService.getProjectInfo(projectId);
	    
	    model.addAttribute("projectInfo", projectInfo);
	    //부서번호 -> 부서이름
	    
	    return "projectForm/projectUpdate";
	}
	
	//프로젝트 수정
	@PostMapping("/projectUpdate")
	public String projectUpdate(ProjectVO projectVO, RedirectAttributes rtt) {
		projectService.updateProject(projectVO);	
		rtt.addFlashAttribute("result", "update success");
		return "redirect:/projectList";
	}
	


	// 프로젝트 삭제
	@GetMapping("/projectDelete")
	public String projectDelete(@RequestParam(name = "projectId") int projectId) {
		projectService.deleteProject(projectId);
		return "redirect:projectList";
	}
	
	
	
	
	
	
	
	
	
	
	
	//주현
}
