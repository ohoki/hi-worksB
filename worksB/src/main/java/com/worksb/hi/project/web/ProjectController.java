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
	
	
	
	
	//이진 - 등록수정삭제
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
			// 공개여부 A1 : Yes
			projectVO.setProjectAccess("A1");
		}else {
			// A2 : No
			projectVO.setProjectAccess("A2");
		}
		
		if("on".equals(projectVO.getManagerAccp())) {
			// 관리자 승인 필요
			projectVO.setManagerAccp("A1");
		}else {
			projectVO.setManagerAccp("A2");
		}
		
		// 부서번호 -> 부서이름 !!!
		
		// 프로젝트명 = 부서이름 + 프로젝트명
//		projectVO.setProjectName(departmentName + "_" + projectVO.getProjectName());
		
		String memberId = (String) session.getAttribute("memberId");
		
		
		projectService.insertProject(projectVO);
		
	    
		return "redirect:/projectFeed?projectId=" + projectVO.getProjectId(); //리턴페이지 수정해야됨!! -> 프로젝트 피드홈
	}
	
	//프로젝트 수정폼
	@GetMapping("/projectUpdate")
	public String projectUpdateForm(@RequestParam int projectId, Model model) {
	    ProjectVO projectInfo = projectService.getProjectInfo(projectId);
	    
	    model.addAttribute("projectInfo", projectInfo);
	    model.addAttribute("projectId", projectId);
	    //부서번호 -> 부서이름
	    
	    return "projectForm/projectUpdate";
	}
	
	//프로젝트 수정
	@PostMapping("/projectUpdate")
	public String projectUpdate(ProjectVO projectVO) {
		int projectId = projectVO.getProjectId();
		
		projectVO.setProjectId(projectId);
		
		if("on".equals(projectVO.getProjectAccess())){
			// 공개여부 checked A1 : Yes
			projectVO.setProjectAccess("A1");
		}else {
			// A2 : No
			projectVO.setProjectAccess("A2");
		}
		
		if("on".equals(projectVO.getManagerAccp())) {
			// 관리자 승인 필요 checked A1 : Yes
			projectVO.setManagerAccp("A1");
		}else {
			// A2 : No
			projectVO.setManagerAccp("A2");
		}
		
		projectService.updateProject(projectVO);

		return "redirect:/projectFeed?projectId=" + projectVO.getProjectId(); // 리턴 페이지 수정해야함!! -> 프로젝트피드홈
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
}
