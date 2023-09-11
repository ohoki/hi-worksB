package com.worksb.hi.projectCmt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.projectCmt.service.ProjectCmtService;
import com.worksb.hi.projectCmt.service.ProjectCmtVO;

@Controller
public class ProjectCmtController {
	@Autowired
	ProjectCmtService projectCmtService;
	
	// 댓글 전체 조회
	@GetMapping("/member/projectCmtList")
	@ResponseBody
	public List<ProjectCmtVO> projectCmtList(ProjectCmtVO projectCmtVO){
		return projectCmtService.projectCmtList(projectCmtVO);
	}
	
	// 댓글 등록
	@PostMapping("/member/insertProjectCmt")
	@ResponseBody
	public int insertProjectCmt(ProjectCmtVO projectCmtVO){
		return projectCmtService.insertProjectCmt(projectCmtVO);
	}
	
	// 댓글 조회
	@GetMapping("/member/commentInfo")
	@ResponseBody
	public ProjectCmtVO projectCmtInfo(ProjectCmtVO projectCmtVO) {
		return projectCmtService.projectCmtInfo(projectCmtVO);
	}
	
	// 댓글 수정
	@PostMapping("/member/updateProjectCmt")
	@ResponseBody
	public int updateProjectCmt(ProjectCmtVO projectCmtVO){
		return projectCmtService.updateProjectCmt(projectCmtVO);
	}
	
	// 댓글 삭제
	@PostMapping("/member/deleteProjectCmt")
	@ResponseBody
	public int deleteProjectCmt(ProjectCmtVO projectCmtVO) {
		return projectCmtService.deleteProjectCmt(projectCmtVO);
	}
}
