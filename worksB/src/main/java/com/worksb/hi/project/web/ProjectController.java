package com.worksb.hi.project.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.ScheVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.project.service.DeptVO;
import com.worksb.hi.project.service.FileDataVO;
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
	
	@Autowired
	MemberService memberService;
	
	//주현
	@Value("${file.upload.path}")
	private String uploadPath;
	@Value("${file.download.path}")
	private String downloadPath;
	
	
	//이진 - 등록수정삭제
	//프로젝트 등록 폼
	@GetMapping("/member/projectInsert")
	public String projectInsertForm(HttpSession session, Model model) {

		// 소속 회사의 부서정보 받아오기
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		int companyId = member.getCompanyId();
		List<DeptVO> department = projectService.getDeptInfo(companyId);
		model.addAttribute("department", department);
		
		return "projectForm/projectInsert";
	}
	
	//프로젝트 등록
	@PostMapping("/member/projectInsert")
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
		
		return "redirect:/member/projectFeed?projectId=" + projectVO.getProjectId();
	}
	
	//프로젝트 수정폼
	@GetMapping("/member/projectUpdate")
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
	@PostMapping("/member/projectUpdate")
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

		return "redirect:/member/projectFeed?projectId=" + projectVO.getProjectId();
	}

	// 프로젝트 삭제
	@GetMapping("/projectDelete")
	public String projectDelete(@RequestParam int projectId) {
		projectService.deleteProject(projectId);
		return "redirect:/home"; // 리턴 페이지 수정해야함!! -> 프로젝트 리스트
	}
	
	// 프로젝트 피드
	@GetMapping("/member/projectFeed")
    public String projectFeed(@RequestParam int projectId, Model model, HttpSession session) {
        ProjectVO projectInfo = projectService.getProjectInfo(projectId);
        // 게시글 리스트
        List<BoardVO> boards = projectService.getBoardList(projectInfo);
        List<BoardVO> pinBoard = projectService.getPinBoardList(projectInfo);
        //즐겨찾기 여부
        PrjParticirVO particir = new PrjParticirVO();
        particir.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
        particir.setProjectId(projectId);
        PrjParticirVO particirInfo = projectService.getParticirByProject(particir);
        //북마크 여부(회원별) -> 2중 for문으로 비교
        projectInfo.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
        List<BoardVO> bookmarkListByMember = boardService.getBookmarkList(projectInfo);
        
        if(bookmarkListByMember != null) {
        	for(int i=0; i<boards.size(); i++) {
        		for(int j=0; j<bookmarkListByMember.size(); j++) {
        			if( boards.get(i).getPrjBoardId() == bookmarkListByMember.get(j).getPrjBoardId()) {
        				boards.get(i).setBookmarkByMember(1);
        				break;
        			} else {
        				boards.get(i).setBookmarkByMember(0);
        			}
        		}
        	}
        }
        List<PrjParticirVO> particirList = projectService.getParticirList(projectId);
        
        model.addAttribute("bookmarkList", bookmarkListByMember);
        model.addAttribute("pinBoardInfo", pinBoard);
        model.addAttribute("particirInfo", particirInfo);
        model.addAttribute("projectInfo", projectInfo);
        model.addAttribute("boards", boards);
        model.addAttribute("particirList", particirList);
        return "project/projectFeed";
    }
	
	// 프로젝트 참여자 조회
	@GetMapping("/member/particirList")
	@ResponseBody
	public List<PrjParticirVO> getParticirList(@RequestParam int projectId){
		return projectService.getParticirList(projectId);
	}

	//프로젝트 승인 대기 조회
	@GetMapping("/member/getCheckParticir")
	@ResponseBody
	public List<PrjParticirVO> getCheckParticir(PrjParticirVO prjParticirVO){
		return projectService.getCheckParticir(prjParticirVO);
	}
	
	//프로젝트 참여자 승인
	@PostMapping("/member/updateAccpParticir")
	@ResponseBody
	public int updateAccpParticir(PrjParticirVO prjParticirVO) {
		return projectService.updateAccpParticir(prjParticirVO);
	}
	
	//프로젝트 참여자 승인거절
	@PostMapping("/member/deleteAccpParticir")
	@ResponseBody
	public int deleteAccpParticir(PrjParticirVO prjParticirVO) {
		return projectService.deleteAccpParticir(prjParticirVO);
	}
		
	// 프로젝트 만료
	@PostMapping("/member/updateProjectCls")
	@ResponseBody
	public int updateProjectCls(ProjectVO projectVO) {
		return projectService.updateProjectCls(projectVO);
	}
	// 프로젝트 나가기
	@PostMapping("/member/deleteParticir")
	@ResponseBody
	public int deleteParticir(PrjParticirVO prjParticirVO) {
		return projectService.deleteParticir(prjParticirVO);
	}
	
	
	
	
	
	
	
	
	
	
	//주현
	
	//회사 전체 프로젝트출력
	@GetMapping("/SelectFromCompany")
	//매개변수에 있는 것은 반환페이지에서 쓸 수 있음
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
	
	
	
	//개인 프로젝트리스트출력
	@GetMapping("/projectList")
	public String projectList(Model m,HttpSession session) {
		String memberId =((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		//북마크가 된 것만을 출력
		m.addAttribute("bookmarked",projectService.searchPrj(memberId));
		
		//북마크기 되지 않은 것
		m.addAttribute("noneBookmarked",projectService.searchPrjCls(memberId,"A1"));
		return"prj/projectList";
	}
	
	//내 즐겨찾기 프로젝트
	@PostMapping("/getStarProject")
	@ResponseBody
	public List<MemberVO> getStarProject(MemberVO member) {
		 return memberService.getProjectList(member);
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
		
		return "redirect:/projectFeed?projectId="+projectId;
	}
	//프로젝트에 참여하기(ajax로)
	@PostMapping("/signOnly")
	@ResponseBody
	public int signOnly
	(int projectId,HttpSession session, String particirAccp) {
		PrjParticirVO vo= new PrjParticirVO();
		vo.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
		vo.setProjectId(projectId);
		vo.setManager("A2");
		vo.setParticirAccp(particirAccp);
		vo.setProjectMarkup("A2");
		
		
		return projectService.insertParticipant(vo);
	}
	
	//파일탭의 검색
	@PostMapping("/searchfiles")
	public String file(
			HttpSession session, 
			@RequestParam("prjId") int prjId,
			Model m,
			SearchVO searchVO,
			@RequestParam(value="nowPage", defaultValue ="1") Integer nowPage,
			@RequestParam(value="cntPerPage", defaultValue ="10") Integer cntPerPage,
			@RequestParam("access") String access)
	
	{	//접근권한, 프로젝트아이디를 vo에 넣기
		ProjectVO vo=new ProjectVO();
		vo.setProjectId(prjId);
		
		//프로젝트정보등록
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		ProjectVO projectInfo = projectService.getProjectInfo(prjId);
		m.addAttribute("projectInfo", projectInfo);
		PrjParticirVO particirInfo=projectService.getMarkupInfo(prjId,memberId);
		m.addAttribute("particirInfo",particirInfo);
		
		//관리자여부 파악
		vo.setMemberId(memberId);
		String manager=projectService.managerOrNot(vo);
	
					//파일공개권한이 전체인 경우
		if(access.equals("J1")) {
			//파일 갯수(검색필터가 있다면 필터링까지 들어감)
			int total=projectService.countWhenPublic(vo,searchVO);
			//갯수에 따른 페이징
			PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
			//출력되는 내용
			List<FileDataVO> list=projectService.viewFileWhenPublic(vo,pagingVO,searchVO);
			//크기단위변경
			for(FileDataVO fvo:list) {
				double bytes=fvo.getFileSize();
				 if (bytes == 0) {
				        fvo.setConvertedSize("0 Bytes");
				    } else if (bytes < 1024) {
				        fvo.setConvertedSize(bytes + " Bytes");
				    } else if (bytes < 1024 * 1024) {
				        fvo.setConvertedSize(String.format("%.2f KB", bytes / 1024));
				    } else if (bytes < 1024 * 1024 * 1024) {
				        fvo.setConvertedSize(String.format("%.2f MB", bytes / (1024 * 1024)));
				    } else {
				        fvo.setConvertedSize(String.format("%.2f GB", bytes / (1024 * 1024 * 1024)));
				    }
			}
			m.addAttribute("paging", pagingVO);
			m.addAttribute("fileList",list);

//공개권한이 전체가 아닌 경우
		}else{
			//로그인한 사람이 관리자라서 전체를 볼 수 있는 경우
			if(manager!=null) {
				//파일 갯수(검색필터가 있다면 필터링까지 들어감)
				int total=projectService.countWhenPublic(vo,searchVO);
				//갯수에 따른 페이징
				PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
				//내용
				List<FileDataVO> list=projectService.viewFileWhenPublic(vo,pagingVO,searchVO);
				//크기단위변경
				for(FileDataVO fvo:list) {
					double bytes=fvo.getFileSize();
					 if (bytes == 0) {
					        fvo.setConvertedSize("0 Bytes");
					    } else if (bytes < 1024) {
					        fvo.setConvertedSize(bytes + " Bytes");
					    } else if (bytes < 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f KB", bytes / 1024));
					    } else if (bytes < 1024 * 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f MB", bytes / (1024 * 1024)));
					    } else {
					        fvo.setConvertedSize(String.format("%.2f GB", bytes / (1024 * 1024 * 1024)));
					    }
				}
				m.addAttribute("paging", pagingVO);
				m.addAttribute("fileList",list);
			
			//로그인한 사람이 관리자가 아닌 경우
			}else if(manager==null) {
				//파일 갯수(검색필터가 있다면 필터링까지 들어감)
				int total=projectService.countWhenWriter(vo,searchVO);
				//갯수에 따른 페이징
				PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
				vo.setMemberId(memberId);
				//내용
				List<FileDataVO> list=projectService.viewFileWhenRestricted(vo,pagingVO,searchVO);
				//크기단위변경
				for(FileDataVO fvo:list) {
					double bytes=fvo.getFileSize();
					 if (bytes == 0) {
					        fvo.setConvertedSize("0 Bytes");
					    } else if (bytes < 1024) {
					        fvo.setConvertedSize(bytes + " Bytes");
					    } else if (bytes < 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f KB", bytes / 1024));
					    } else if (bytes < 1024 * 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f MB", bytes / (1024 * 1024)));
					    } else {
					        fvo.setConvertedSize(String.format("%.2f GB", bytes / (1024 * 1024 * 1024)));
					    }
				}
				m.addAttribute("paging", pagingVO);
				m.addAttribute("fileList",list);
			}
		}

		return "project/projectFile";
	}
	
	//파일탭
	@GetMapping("/filetab")//vo로 넘어오는 것: projectId,fileAccess
	public String file(
			HttpSession session, ProjectVO vo,Model m,
			SearchVO searchVO,
			@RequestParam(value="nowPage", defaultValue ="1") Integer nowPage,
			@RequestParam(value="cntPerPage", defaultValue ="10") Integer cntPerPage)
	{
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		//프로젝트정보등록
		ProjectVO projectInfo = projectService.getProjectInfo(vo.getProjectId());
		m.addAttribute("projectInfo", projectInfo);
		
		PrjParticirVO particir = new PrjParticirVO();
        particir.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
        particir.setProjectId(vo.getProjectId());
        PrjParticirVO particirInfo = projectService.getParticirByProject(particir);
		m.addAttribute("particirInfo",particirInfo);
		
		//관리자여부 파악
		vo.setMemberId(memberId);
		String manager=projectService.managerOrNot(vo);
	
					//파일공개권한이 전체인 경우
		if(vo.getFileAccess().equals("J1")) {
			//파일 갯수(검색필터가 있다면 필터링까지 들어감)
			int total=projectService.countWhenPublic(vo,searchVO);
			//갯수에 따른 페이징
			PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
			//출력되는 내용
			List<FileDataVO> list=projectService.viewFileWhenPublic(vo,pagingVO,searchVO);
			//크기단위변경
			for(FileDataVO fvo:list) {
				double bytes=fvo.getFileSize();
				 if (bytes == 0) {
				        fvo.setConvertedSize("0 Bytes");
				    } else if (bytes < 1024) {
				        fvo.setConvertedSize(bytes + " Bytes");
				    } else if (bytes < 1024 * 1024) {
				        fvo.setConvertedSize(String.format("%.2f KB", bytes / 1024));
				    } else if (bytes < 1024 * 1024 * 1024) {
				        fvo.setConvertedSize(String.format("%.2f MB", bytes / (1024 * 1024)));
				    } else {
				        fvo.setConvertedSize(String.format("%.2f GB", bytes / (1024 * 1024 * 1024)));
				    }
			}
			m.addAttribute("paging", pagingVO);
			m.addAttribute("fileList",list);
			
//공개권한이 전체가 아닌 경우
		}else{
			//로그인한 사람이 관리자라서 전체를 볼 수 있는 경우
			if(manager!=null) {
				//파일 갯수(검색필터가 있다면 필터링까지 들어감)
				int total=projectService.countWhenPublic(vo,searchVO);
				//갯수에 따른 페이징
				PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
				//내용
				List<FileDataVO> list=projectService.viewFileWhenPublic(vo,pagingVO,searchVO);
				//크기단위변경
				for(FileDataVO fvo:list) {
					double bytes=fvo.getFileSize();
					 if (bytes == 0) {
					        fvo.setConvertedSize("0 Bytes");
					    } else if (bytes < 1024) {
					        fvo.setConvertedSize(bytes + " Bytes");
					    } else if (bytes < 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f KB", bytes / 1024));
					    } else if (bytes < 1024 * 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f MB", bytes / (1024 * 1024)));
					    } else {
					        fvo.setConvertedSize(String.format("%.2f GB", bytes / (1024 * 1024 * 1024)));
					    }
				}
				m.addAttribute("paging", pagingVO);
				m.addAttribute("fileList",list);
			
			//로그인한 사람이 관리자가 아닌 경우
			}else if(manager==null) {
				//파일 갯수(검색필터가 있다면 필터링까지 들어감)
				int total=projectService.countWhenWriter(vo,searchVO);
				//갯수에 따른 페이징
				PagingVO pagingVO = new PagingVO(total, nowPage, cntPerPage);
				vo.setMemberId(memberId);
				List<FileDataVO> list=projectService.viewFileWhenRestricted(vo,pagingVO,searchVO);
				//크기단위변경
				for(FileDataVO fvo:list) {
					double bytes=fvo.getFileSize();
					 if (bytes == 0) {
					        fvo.setConvertedSize("0 Bytes");
					    } else if (bytes < 1024) {
					        fvo.setConvertedSize(bytes + " Bytes");
					    } else if (bytes < 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f KB", bytes / 1024));
					    } else if (bytes < 1024 * 1024 * 1024) {
					        fvo.setConvertedSize(String.format("%.2f MB", bytes / (1024 * 1024)));
					    } else {
					        fvo.setConvertedSize(String.format("%.2f GB", bytes / (1024 * 1024 * 1024)));
					    }
				}
				m.addAttribute("paging", pagingVO);
				m.addAttribute("fileList",list);
			}
		}

		return "project/projectFile";
	}
	
	
	
	
	//파일업로드
	@PostMapping("/uploadFiles")
	public String uploadfile(@RequestPart(name = "file") MultipartFile file, 
			HttpSession session, Model m, FileDataVO vo,
			@RequestParam("prjId") String projectId,
			SearchVO searchVO) 
	{	//프로젝트정보등록
		String memberId=((MemberVO)session.getAttribute("memberInfo")).getMemberId();
		ProjectVO projectInfo = projectService.getProjectInfo(Integer.valueOf(projectId));
		m.addAttribute("projectInfo", projectInfo);

		
		
		
		String originalName = file.getOriginalFilename();	
		String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
		String folderPath = makeFolder();
		String uuid = UUID.randomUUID().toString();
		String uploadFileName = folderPath + File.separator + uuid + "_" + fileName;
		String saveName = uploadPath + File.separator + uploadFileName;
		//해당 경로에 파일이 존재하는지 확인할 수 있음
		Path savePath = Paths.get(saveName);
		
		try {
			file.transferTo(savePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//게시판종류
		vo.setBoardType("C5");

		vo.setFileName(fileName);
		//작성시간
		LocalDate now=LocalDate.now();
		//date타입으로 바꾸기
		Instant instant=now.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant();
		Date date = Date.from(instant);
		vo.setFileRegdate(date);
		//확장자로 파일종류추출
		String[] parts = fileName.split("\\.");
		String extension = parts[parts.length - 1];
		vo.setFileType(extension);
		//확장자를 포함한 파일이름(??)
		vo.setFilePath(fileName);
		//file용량
		vo.setFileSize(file.getSize());
		System.out.println(vo.getFileSize()+"fileSize");
		//
		vo.setRealFilePath(setFilePath(uploadFileName));
		//fileId는 xml에서 처리
		vo.setBoardId(1);
		
		vo.setProjectId(Integer.parseInt(projectId));
		vo.setMemberId(memberId);
		projectService.insertFile(vo);

		return "redirect:/filetab?projectId="+projectId+"&fileAccess="+projectInfo.getFileAccess() ;
	}
	
	//폴더생성
		public String makeFolder() {
			String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
			
			String folderPath = str.replace("/", File.separator);
			File uploadPathFolder = new File(uploadPath, folderPath);
			
			if(uploadPathFolder.exists() == false) {
				uploadPathFolder.mkdirs();
			}
			
			return folderPath;
		}
		
		public String setFilePath(String uploadFileName) {
			return uploadFileName.replace(File.separator, "/");
		}
		
		@GetMapping("/downloadFile/{fileId}")
		public void downloadFile(
		        @PathVariable("fileId") int fileId, //경로변수
		        HttpServletResponse response) throws IOException {

		    FileDataVO fileData = projectService.getFileById(fileId);

		    String filePath =downloadPath+fileData.getRealFilePath(); 

	        try {
	            // 파일 경로를 Path 객체로 변환
	            Path path = Paths.get(filePath);
	            // 파일을 바이트 배열로 읽어오기
	            byte[] fileContent = Files.readAllBytes(path);
	            fileData.setFileContent(fileContent);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    

	        // 파일 다운로드 설정
//	        response.setContentType("application/octet-stream");
//	        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileData.getFileName() + "\"");

	        String encodedFileName = URLEncoder.encode(fileData.getFileName(), StandardCharsets.UTF_8.toString());
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
	        try (OutputStream outputStream=response.getOutputStream()) {
	            outputStream.write(fileData.getFileContent());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		}
		@PostMapping("/updateDownloadFile")
		@ResponseBody
		public int downloadList(@RequestBody FileDataVO data,HttpSession session) throws UnsupportedEncodingException, URISyntaxException {
			data.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
			return projectService.updateFile(data);
		}
		
		//정현
		//프로젝트 캘린더 페이지 이동
		@GetMapping("projectCalendar")
		public String prjCalendar(@RequestParam int projectId, Model model, HttpSession session) {
	        ProjectVO projectInfo = projectService.getProjectInfo(projectId);
	        
	        //해당 프로젝트의 모든 일정 캘린더화
	        List<ScheVO> scheList =  boardService.getScheCalendar(projectInfo.getProjectId());
	        //해당 프로젝트의 상위 업무 캘린더화
	        List<TaskVO> taskList = boardService.getTaskCalendar(projectInfo.getProjectId());
	        
			//json객체 리스트화
			JSONObject jsonObj = new JSONObject();
			JSONArray scheArr = new JSONArray();
			JSONArray taskArr = new JSONArray();
			HashMap<String, Object> hash = new HashMap<String, Object>();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
			for(int i=0;i<scheList.size();i++) {
				hash.put("id", scheList.get(i).getPrjBoardId());//단건조회용 sche_id 입력
				hash.put("title", scheList.get(i).getPrjBoardTitle()); //제목
				//원하는 데이터 포맷 지정
				String strStartDate = simpleDateFormat.format(scheList.get(i).getStartDate()); 
				hash.put("start", strStartDate); //시작일자
				String strEndDate = simpleDateFormat.format(scheList.get(i).getEndDate()); 
				hash.put("end", strEndDate); //종료일자
				hash.put("color", "rgba(249, 166, 52, 0.4)");
				
				jsonObj = new JSONObject(hash);
				scheArr.add(jsonObj);
			}
			for(int i=0;i<taskList.size();i++) {
				hash.put("id", "t"+taskList.get(i).getPrjBoardId());//단건조회용 sche_id 입력
				hash.put("title", taskList.get(i).getPrjBoardTitle()); //제목
				//원하는 데이터 포맷 지정
				String strStartDate = simpleDateFormat.format(taskList.get(i).getStartDate()); 
				hash.put("start", strStartDate); //시작일자
				String strEndDate = simpleDateFormat.format(taskList.get(i).getEndDate()); 
				hash.put("end", strEndDate); //종료일자
				hash.put("allDay", "true");
				hash.put("color", "rgba(156, 187, 58, 0.4)");
				
				jsonObj = new JSONObject(hash);
				taskArr.add(jsonObj);
			}
			
			//참여자 정보
			PrjParticirVO particir = new PrjParticirVO();
	        particir.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
	        particir.setProjectId(projectId);
	        PrjParticirVO particirInfo = projectService.getParticirByProject(particir);
			model.addAttribute("scheList",scheArr);
	        model.addAttribute("taskList", taskArr);
	        model.addAttribute("projectInfo", projectInfo);
	        model.addAttribute("particirInfo", particirInfo);
	        
			return "project/projectCalendar";
		}
}