package com.worksb.hi.project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;

@Controller
public class ProjectController {
	@Autowired
	ProjectService projectService;
	
	@GetMapping("/projectInsert")
	public String projectInsertForm() {
		// 해당 회사의 부서이름 받아와서 나타내야됨!!
		
		return "project/projectInsert";
	}
	
	@PostMapping("/projectInsert")
	public String projectInsertProcess(ProjectVO projectVO) {
		if("on".equals(projectVO.getProjectAccess())){
			 projectVO.setProjectAccess("A1");
		}else {
			projectVO.setProjectAccess("A2");
		}
		
		if("on".equals(projectVO.getManagerAccp())) {
			projectVO.setManagerAccp("A1");
		}else {
			projectVO.setManagerAccp("A2");
		}
		
		// 부서이름 나타낼 코드작성해야됨!!
		
		projectService.insertProject(projectVO);
		return "home";
	}
}
