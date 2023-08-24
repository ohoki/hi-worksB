package com.worksb.hi.project.web;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.TaskVO;
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
	
	@Autowired
	BoardService boardService;
	
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
	    
	    // 프로젝트 만료 여부 NO
	    projectVO.setProjectCls("A2");
	    
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
		// 즐겨찾기 여부 A2
		participant.setProjectMarkup("A2");
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
    public String projectFeed(@RequestParam int projectId, Model model, HttpSession session) {
        ProjectVO projectInfo = projectService.getProjectInfo(projectId);
        // 게시글 리스트
        List<BoardVO> boards = projectService.getBoardList(projectInfo);
        //즐겨찾기 여부
        PrjParticirVO particir = new PrjParticirVO();
        particir.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
        particir.setProjectId(projectId);
        PrjParticirVO particirInfo = projectService.getParticirByProject(particir);
        
        model.addAttribute("particirInfo", particirInfo);
        model.addAttribute("projectInfo", projectInfo);
        model.addAttribute("boards", boards);
        return "project/projectFeed";
    }
	
	// 프로젝트 참여자 조회
	@GetMapping("particirList")
	@ResponseBody
	public List<PrjParticirVO> getParticirList(@RequestParam int projectId){
		return projectService.getParticirList(projectId);
	}
	
	// 프로젝트 업무페이지
	@GetMapping("/projectTask")
	public String projectTask(@RequestParam int projectId, Model model, HttpSession session) {
		ProjectVO projectInfo = projectService.getProjectInfo(projectId);
		List<BoardVO> taskList = projectService.getTaskList(projectInfo);
		
		model.addAttribute("projectInfo", projectInfo);
		model.addAttribute("taskList", taskList);
	    
	return "project/projectTask";
	}
	
	
	
	
	
	
	
	
	//주현
	
	//회사 전체 프로젝트출력
	@GetMapping("/SelectFromCompany")
	public String SelectCom(Model m,HttpSession session, ProjectVO VO) {
		Integer companyId=((CompanyVO)session.getAttribute("companyInfo")).getCompanyId();
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		VO.setCompanyId(companyId);
		
		List<PrjParticirVO> myList = projectService.selectAllparticier(memberId);
		List<ProjectVO> list = projectService.selectFromCompany(VO);
		List<DeptVO> deptList = projectService.getDeptInfo(companyId); 
				
		for(ProjectVO vo :list) {
			Optional<PrjParticirVO>op= myList.stream().filter(part -> part.getProjectId() ==vo.getProjectId() ).findAny();
			if(!op.isEmpty())
				vo.setParticirAccp(op.get().getParticirAccp());
		}
		m.addAttribute("projectList",list);
		m.addAttribute("deptList", deptList);
		
		//m.addAttribute("particirList",myList);
    
		return "prj/selectFromCompany";
	}
	
	
	
	//개인 프로젝트리스트출력(리스트형식)
	@GetMapping("/projectList")
	public String projectList(Model m,HttpSession session) {
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		//북마크가 된 것만을 출력
		m.addAttribute("bookmarked",projectService.searchPrj(memberId));
		
		//북마크기 되지 않은 것
		m.addAttribute("noneBookmarked",projectService.searchPrjCls(memberId,"A1"));
		return"prj/projectList";
	}

	//즐겨찾기갱신
	@PostMapping("/updateStar")
	@ResponseBody
	public String removeStar(@RequestBody ProjectVO starInfo,HttpSession session) {
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		starInfo.setMemberId(memberId);
		
		projectService.updateStar(starInfo);
		return"bookmark-updated";
	}
	
	//프로젝트참여하기(requestparam형식)
	@GetMapping("/signIn")
	public String signIn(
			@RequestParam int projectId,HttpSession session,
			@RequestParam String accp) {
		PrjParticirVO vo= new PrjParticirVO();
		vo.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
		vo.setProjectId(projectId);
		vo.setManager("A2");
		vo.setParticirAccp(accp);
		vo.setProjectMarkup("A2");
		projectService.insertParticipant(vo);
		
		return "prj/selectFromCompany";
	}
	//프로젝트에 참여하기(ajax로)
	@PostMapping("/signOnly")
	@ResponseBody
	public String signOnly
	(int projectId,HttpSession session, String particirAccp) {
		PrjParticirVO vo= new PrjParticirVO();
		vo.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
		vo.setProjectId(projectId);
		vo.setManager("A2");
		vo.setParticirAccp(particirAccp);
		vo.setProjectMarkup("A2");
		projectService.insertParticipant(vo);
		
		return "success";
	}
}
