package com.worksb.hi.project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String projectInsertForm() {
		//해당 회사의 부서이름 받아와야함!!
		
		return "project/projectInsert";
	}
	
	//프로젝트 등록
	@PostMapping("/projectInsert")
	public String projectInsertProcess(ProjectVO projectVO) {
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
		
		
		projectService.insertProject(projectVO);
		return "home"; //리턴페이지 수정해야됨!!
	}
	// 프로젝트 수정
//	@GetMapping("/projectUpdate")
//	public String projectUpdateForm(ProjectVO projectVO, Model model) {
//		ProjectVO vo = projectService.getProjectInfo(projectVO);
//		model.addAttribute("projectInfo", vo);
//		return "project/projectUpdate";
//	}
//	
//	@PostMapping("/projectUpdate")
//	public Ma

	
	
	
	
	
	
	
	
	
	
	
	//주현
}
