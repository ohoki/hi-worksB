package com.worksb.hi.board.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.worksb.hi.board.service.AllTaskBoardVO;
import com.worksb.hi.board.service.BoardRequestVO;
import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.ScheParticirVO;
import com.worksb.hi.board.service.ScheVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.board.service.VoteVO;
import com.worksb.hi.comLike.service.ComLikeVO;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.project.service.PrjParticirVO;
import com.worksb.hi.project.service.ProjectService;
import com.worksb.hi.project.service.ProjectVO;

import oracle.jdbc.proxy.annotation.Post;

// 이진 0818 게시판관리 - 게시글,업무,일정,투표 등록

@Controller
public class BoardController {
	//이진	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	MemberService memberService;
	
	// 이진
	// 게시글 등록 폼
    @GetMapping("/boardInsert")
	public String BoardInsertForm(@RequestParam int projectId, HttpSession session, Model model) {
		model.addAttribute("projectId", projectId);
		return "project/boardInsert";
	}
    
    // 업무글 등록
    @RequestMapping("taskInsert")
    @ResponseBody
    public int taskInsert(@RequestBody BoardRequestVO brVO) {
    	
    	// 게시글 등록
    	BoardVO boardVO = brVO.getBoardVO();
    	boardService.insertBoard(brVO.getBoardVO());
    	// 상위 업무 등록
    	TaskVO taskVO = brVO.getTaskVO();
    	taskVO.setPrjBoardId(boardVO.getPrjBoardId());
    	boardService.insertTask(taskVO);
    	
    	// 상위 업무 담당자 등록
    	List<TaskVO> managerList = brVO.getPrjManager();
    	if(managerList != null) {
    		for(int i=0; i < managerList.size(); i++) {
    			TaskVO taskManager = managerList.get(i);
    			//게시글 id
    			taskManager.setPrjBoardId(taskVO.getPrjBoardId());
    			boardService.insertTaskManager(taskManager);
    		}
    	}
    	
    	// 하위 업무 등록
    	List<TaskVO> taskList = brVO.getSubTask();
    	List<TaskVO> subManagerList = brVO.getSubManager();
    	if(taskList != null){
    		TaskVO subtaskVO ;
	    	for(int i=0; i < taskList.size(); i++) {
	    		BoardVO subBoardVO = new BoardVO();
	    		subtaskVO = taskList.get(i);
	    		
	    		// 하위 업무 - 게시글 테이블 저장
	    		subBoardVO.setPrjBoardTitle(subtaskVO.getPrjBoardTitle());
	    		subBoardVO.setMemberId(boardVO.getMemberId());
	    		subBoardVO.setProjectId(boardVO.getProjectId());
	    		subBoardVO.setBoardType(boardVO.getBoardType());
	    		subBoardVO.setInspYn("E2");
	    		boardService.insertBoard(subBoardVO);
	    		
	    		// 하위 업무 - 업무 테이블 저장
	    		subtaskVO.setPrjBoardId(subBoardVO.getPrjBoardId());
	    		subtaskVO.setHighTaskId(taskVO.getTaskId());
	    		boardService.insertTask(subtaskVO);
	    		
	    		// 하위 업무 담당자 boardId 설정
	        	for(int j=0; j<subManagerList.size(); j++) {
	        		TaskVO subManager = subManagerList.get(j);
	        		if(subManager.getPrjBoardId() == i) {
	        			subManager.setPrjBoardId(subBoardVO.getPrjBoardId());
	        		}
	        	}
	    		
	    	}
    	}
    	//하위 업무 담당자 등록
    	if(subManagerList != null) {
    		for(int i=0; i<subManagerList.size(); i++) {
    			boardService.insertTaskManager(subManagerList.get(i));
    		}
    	}
    	int result = boardVO.getProjectId();
    	
    	return result; 
    }
    
	//게시글 등록 - 게시글, 일정, 투표
	@PostMapping("/boardInsert")
	public String boardInsertProcess(BoardVO boardVO, VoteVO voteVO, ScheVO scheVO, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		String memberId = member.getMemberId();
		
        boardVO.setMemberId(memberId);
		
        String boardType = boardVO.getBoardType();
        
        // 글 prj_project
		boardService.insertBoard(boardVO);
        
		int prjBoardId = boardVO.getPrjBoardId();
		
		// 일정
        if(boardType.equals("C6")) {
        	scheVO.setPrjBoardId(prjBoardId);
        	
        	if(!scheVO.getAlarmDateCode().equals("")) {
        		//알람 시간 구하기
            	String code = scheVO.getAlarmDateCode();
            	Date startDate = scheVO.getStartDate();
            	Calendar cal = Calendar.getInstance();
            	// L1 -> 10분전, L2 -> 1시간 전, L3 -> 1일 전, L4 -> 7일 전
            	cal.setTime(startDate);
            	if(code.equals("L1")) {
            		cal.add(Calendar.MINUTE, -10);
            	} else if(code.equals("L2")) {
            		cal.add(Calendar.HOUR, -1);
            	} else if(code.equals("L3")) {
            		cal.add(Calendar.DATE, -1);
            	} else if(code.equals("L4")) {
            		cal.add(Calendar.DATE, -7);
            	}
            	//알림 시간 등록
            	scheVO.setAlarmDate(cal.getTime());
        	}
        	
        	boardService.insertSche(scheVO);
        	
        }else if(boardType.equals("C7")) {
        	// 투표
        	voteVO.setPrjBoardId(prjBoardId);
        	
        	voteVO.setAnonyVote(voteVO.getAnonyVote() == null ? "A2" : voteVO.getAnonyVote());
        	voteVO.setCompnoVote(voteVO.getCompnoVote() == null ? "A2" : voteVO.getCompnoVote());
        	voteVO.setResultYn(voteVO.getResultYn() == null ? "A2" : voteVO.getResultYn());
        	
        	// 투표글 등록
        	boardService.insertVote(voteVO);
        }
        
		return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
	}
	
	
	// 일정 조회
	@GetMapping("getScheInfo")
	@ResponseBody
	public ScheVO getScheInfo(ScheVO scheVO) {
		return boardService.getScheInfo(scheVO); 
	}
	
	// 일정 수정용 조회
	@GetMapping("getSche")
	@ResponseBody
	public Map<String, Object> getScheBoard(ScheVO scheVO){
		Map<String, Object> resultMap = new HashMap<>();
		
		int prjBoardId = scheVO.getPrjBoardId();
        BoardVO boardInfo = boardService.getBoardInfo(prjBoardId);
        
        ScheVO scheInfo = boardService.getScheInfo(scheVO);
        
        resultMap.put("boardInfo", boardInfo);
        resultMap.put("scheInfo", scheInfo);
        
        return resultMap;
	}
	// 투표 조회
	@GetMapping("getVoteInfo")
	@ResponseBody
	public Map<String, Object> getVoteInfo(VoteVO voteVO) {
		
        Map<String, Object> resultMap = new HashMap<>();
        
        int prjBoardId = voteVO.getPrjBoardId();
        BoardVO boardInfo = boardService.getBoardInfo(prjBoardId);
        
        // 투표글
        List<VoteVO> voteInfo = boardService.getVoteInfo(voteVO);
        // 투표 항목
        List<VoteVO> voteList = boardService.getVoteList(voteVO);
        // 내가 선택한 투표 항목
        List<VoteVO> voteListMine = boardService.getVoteListByMember(voteVO);
        
        resultMap.put("voteInfo", voteInfo);
        resultMap.put("voteList", voteList);
        resultMap.put("voteListMine", voteListMine);
        resultMap.put("boardInfo", boardInfo);
        
        return resultMap;
	}
	
	// 업무 상세 조회
	@GetMapping("getTaskInfo")
	@ResponseBody
	public Map<String, Object> getTaskInfo(@RequestParam("prjBoardId") int prjBoardId) {
	    Map<String, Object> resultMap = new HashMap<>();
	    
	    // 해당 게시글 번호
	    AllTaskBoardVO allTaskBoardVO = new AllTaskBoardVO();
	    allTaskBoardVO.setPrjBoardId(prjBoardId);

	    // 해당 업무 정보
	    List<AllTaskBoardVO> highTask = boardService.getTaskInfo(allTaskBoardVO);
	    // 업무 담당자 리스트
	    List<AllTaskBoardVO> highManager = boardService.getManager(allTaskBoardVO);

	    // 하위 업무
	    // 상위 업무의 업무번호
	    int taskId = boardService.getHighTaskId(allTaskBoardVO);
	    // 해당 업무의 하위 업무 리스트
	    List<AllTaskBoardVO> subTask = boardService.getSubTask(taskId);
	    // 각 하위 업무의 담당자 리스트
	    Map<Integer, List<AllTaskBoardVO>> subManager = new HashMap<>();

	    for (int i = 0; i < subTask.size(); i++) {
	        // 하위 업무 정보
	        AllTaskBoardVO subTaskInfo = subTask.get(i);
	        // 하위 업무의 게시글Id
	        int subTaskPrjBoardId = subTaskInfo.getPrjBoardId();
	        // 객체에 하위 업무의 게시글 Id 설정하기
	        allTaskBoardVO.setPrjBoardId(subTaskPrjBoardId);
	        // 하위 업무의 담당자 정보 조회
	        List<AllTaskBoardVO> subManagerInfo = boardService.getManager(allTaskBoardVO);
	        // 하위 업무 담당자 정보 추가
	        subManager.put(subTaskPrjBoardId, subManagerInfo);
	    }

	    resultMap.put("highTask", highTask);
	    resultMap.put("subTask", subTask);
	    resultMap.put("highManager", highManager);
	    resultMap.put("subManager", subManager);
	    

	    return resultMap;
	}
	
	// 프로젝트 업무탭 - 전체 업무 조회
	@GetMapping("/projectTask")
	public String projectTask(@RequestParam int projectId, Model model, HttpSession session) {
		// 프로젝트 정보
		ProjectVO projectInfo = projectService.getProjectInfo(projectId);
		// 상위 업무 리스트
		List<AllTaskBoardVO> taskList = boardService.getTaskList(projectId);
		
		model.addAttribute("projectInfo", projectInfo);
		model.addAttribute("taskList", taskList);
		
		return "project/projectTask";
	}


	//상위,하위 업무 수정
	@PostMapping("/updateTask")
	@ResponseBody
	public int updateTask(@RequestBody BoardRequestVO brVO) {
    	// 게시글 수정
    	BoardVO boardVO = brVO.getBoardVO();
    	boardService.updateBoard(brVO.getBoardVO());
    	// 상위 업무 수정
    	TaskVO taskVO = brVO.getTaskVO();
    	taskVO.setPrjBoardId(boardVO.getPrjBoardId());
    	boardService.updateTask(taskVO);
    	// 상위 업무 담당자 수정 (삭제 후 등록)
    	List<TaskVO> managerList = brVO.getPrjManager();
    	if(managerList.size() != 0) {
    		//해당 업무의 담당자 전체 삭제
        	boardService.deleteManagerList(managerList.get(0));
        	//수정된 업무의 담당자 등록
        	if(managerList != null) {
        		for(int i=0; i < managerList.size(); i++) {
        			TaskVO taskManager = managerList.get(i);
        			
        			boardService.insertTaskManager(taskManager);
        		}
        	}
    	}
    	
    	return boardVO.getProjectId(); 
	}

	// 업무 삭제
	@PostMapping("/deleteTask")
	@ResponseBody
	public int deleteTask(TaskVO taskVO){
    	return boardService.deleteTask(taskVO); 
	}
	//프로젝트 일정 수정
	@PostMapping("updateFeedSche")
	public String updateFeedSche(ScheVO scheVO, BoardVO boardVO) {
		boardService.updateBoard(boardVO);
		boardService.updateSche(scheVO);
		return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
	}
	
	// 투표 삭제
	@PostMapping("/deleteVote")
	@ResponseBody
	public int deleteVote(VoteVO voteVO) {
		return boardService.deleteVote(voteVO);
	}
	
	// 투표 수정
	@PostMapping("/updateVote")
	public String updateVote(VoteVO voteVO, int projectId) {
			
        	voteVO.setAnonyVote(voteVO.getAnonyVote() == null ? "A2" : voteVO.getAnonyVote());
        	voteVO.setCompnoVote(voteVO.getCompnoVote() == null ? "A2" : voteVO.getCompnoVote());
        	voteVO.setResultYn(voteVO.getResultYn() == null ? "A2" : voteVO.getResultYn());
			
        	boardService.updateVote(voteVO);
        	
			String[] listContentArr = voteVO.getListContent().split(",");
			for(int i=0; i<listContentArr.length; i++) {
				voteVO.setListContent(listContentArr[i]);
				boardService.insertVoteList(voteVO);
			}
			return "redirect:/projectFeed?projectId=" + projectId;
		}
	
	// 투표 인원수
	@GetMapping("/countVoteParticir")
	@ResponseBody
	public int countVoteParticir(VoteVO voteVO) {
		return boardService.countVoteParticir(voteVO);
	}
	
	// 일반글 수정
	@PostMapping("/updateBoard")
	public String updateBoard(BoardVO boardVO) {
		boardService.updateBoard(boardVO);
		return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
	}
	
	// 게시글 정보
	@GetMapping("/getBoardInfo")
	@ResponseBody
	public BoardVO getBoardInfo(int prjBoardId) {
		return boardService.getBoardInfo(prjBoardId);
	}
	
	// 일반글 삭제
	@PostMapping("/deleteBoard")
	@ResponseBody
	public int deleteBoard(BoardVO boardVO) {
		return boardService.deleteBoard(boardVO);
	}
	
	// 게시글 좋아요 등록/해제
	@GetMapping("/likeBoard")
	@ResponseBody
	public  Map<String, Object> like(BoardVO boardVO){
		Map<String, Object> resultMap = new HashMap<>();
		
		BoardVO likeCheck = boardService.getMemLike(boardVO);
		if(likeCheck == null) {
			boardService.insertPrjLike(boardVO);
			resultMap.put("checkLike", "like");
		} else {
			boardService.deletePrjLike(boardVO);
			resultMap.put("checkLike", "unlike");
		}
		return resultMap;
	}
	
	// 좋아요 여부 / 좋아요 전체 수
	@GetMapping("/gePrjLike")
	@ResponseBody
	public Map<String, Object> gePrjLike(BoardVO boardVO) {
		Map<String, Object> resultMap = new HashMap<>();
		
		BoardVO memberLike = boardService.getMemLike(boardVO);
		List<BoardVO> boardLike = boardService.getPrjLike(boardVO);
		
		resultMap.put("memberLike", memberLike);
		resultMap.put("boardLike", boardLike);
		
		return resultMap;
	}
	
	
	
	//상단 고정 여부 수정
	@PostMapping("/updatePin")
	public String updatePin(BoardVO boardVO) {
		boardService.updatePin(boardVO);
		
		return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
	}
	
	// 북마크 등록
	@RequestMapping("/insertBookmark")
	@ResponseBody
	public int insertBookmark(BoardVO boardVO) {
		boardService.insertBookmark(boardVO);
		return boardVO.getProjectId();
	}
	
	// 북마크 삭제
	@RequestMapping("/deleteBookmark")
	@ResponseBody
	public int deleteBookmark(BoardVO boardVO) {
		boardService.deleteBookmark(boardVO);
		return boardVO.getProjectId();
	}
	

	// 일정 참가,미참
	@RequestMapping("/sheParticipate")
	@ResponseBody
	public int sheParticipate(ScheParticirVO spVO) {
		return boardService.sheParticipate(spVO);
	}
	
	// 투표 삭제 및 등록
	@PostMapping("/votePaticir")
	@ResponseBody
	public int votePaticir(@RequestBody List<VoteVO> voteParticir) {
		return boardService.voteInsert(voteParticir);
	};
	
	// 투표 취소
	@PostMapping("/votePaticirDelete")
	@ResponseBody
	public void votePaticirDelete(VoteVO voteVO) {
		boardService.votePaticirDelete(voteVO);
	}
	
	//게시글 별 매니저 리스트 출력
    @GetMapping("/getManager")
    @ResponseBody
    public List<AllTaskBoardVO> getManager(AllTaskBoardVO allTaskBoardVO) {
		return boardService.getManager(allTaskBoardVO);
	} 
	
	//게시글 별 일정 참여자 리스트 출력
    @GetMapping("getParticir")
    @ResponseBody
    public List<ScheParticirVO> getParticir(ScheParticirVO particir) {
		return boardService.getParticir(particir);
	} 
    
    //게시글 별 투표 참여자 리스트 출력
    @GetMapping("getVoteParticir")
    @ResponseBody
    public List<VoteVO> getVoteParticir(VoteVO particir) {
		return boardService.getVoteParticir(particir);
	} 
	
    //업무 정보 변경
    @PostMapping("/updateTaskInfo")
    @ResponseBody
    public int updateTaskInfo(AllTaskBoardVO taskVO) {
    	return boardService.updateTaskInfo(taskVO);
    }
	
    //북마크 정보 가져오기
    @PostMapping("/getBookmarkByMe")
    @ResponseBody
    public List<BoardVO> getBookmarkByMe(ProjectVO projectInfo) {
    	return boardService.getBookmarkList(projectInfo);
    }
    
    //상단 고정 정보 가져오기
    @PostMapping("/getPinBoard")
    @ResponseBody
    public List<BoardVO> getPinBoard(ProjectVO projectInfo) {
    	return projectService.getPinBoardList(projectInfo);
    }
	
	
	
	
	
	
	
	
	

	//정현
	//프로젝트 일정,업무 캘린더 전체 조회
	@GetMapping("projectCalendarRender")
	@ResponseBody
	public Map<String, List<Map<String, Object>>> prjCalendar(@RequestParam int projectId, HttpSession session) {
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
			hash.put("color", "#2a9d8f");
			
			jsonObj = new JSONObject(hash);
			taskArr.add(jsonObj);
		}
//		//참여자 정보
//		PrjParticirVO particir = new PrjParticirVO();
//        particir.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
//        particir.setProjectId(projectId);
//        PrjParticirVO particirInfo = projectService.getParticirByProject(particir);
        
        HashMap<String, List<Map<String, Object>>> result = new HashMap<String, List<Map<String,Object>>>();
        result.put("scheList", scheArr);
        result.put("taskList", taskArr);
        
		return result;
	}
	
	//프로젝트 일정 입력
	@PostMapping("calInsertSche")
	@ResponseBody
	public String insertSche(@RequestBody BoardRequestVO brVO) {
		System.out.println(brVO);
		BoardVO boardVO = new BoardVO();
		ScheVO scheVO = new ScheVO();
		boardVO = brVO.getBoardVO();
		scheVO = brVO.getScheVO();
		
		boardService.insertBoard(boardVO);
		int prjBoardId = boardVO.getPrjBoardId();
		scheVO.setPrjBoardId(prjBoardId);
		boardService.insertSche(scheVO);
		return "";
	}
	
	//프로젝트 일정 수정
	@PostMapping("prjScheUpdate")
	@ResponseBody
	public String prjScheUpdate(@RequestBody BoardRequestVO brVO) {
		BoardVO boardVO = new BoardVO();
		ScheVO scheVO = new ScheVO();
		boardVO = brVO.getBoardVO();
		scheVO = brVO.getScheVO();
		scheVO.setPrjBoardId(boardVO.getPrjBoardId());
		
		boardService.updateBoard(boardVO);
		boardService.updateSche(scheVO);
		return "";
	}
	//프로젝트 일정 삭제
	@RequestMapping("deleteSche")
	@ResponseBody
	public int deleteSche(ScheVO scheVO) {
		int deleteSche = boardService.deleteSche(scheVO);
		
		BoardVO boardVO = new BoardVO();
		boardVO.setPrjBoardId(scheVO.getPrjBoardId());
		int deleteBoard = boardService.deleteBoard(boardVO);
		
		int deleteParticir = boardService.deleteScheParticir(scheVO.getPrjBoardId());
		return deleteSche+deleteBoard+deleteParticir;
	}
	
	//프로젝트 일정 캘린더 상세조회
	@GetMapping("getScheBoardInfo")
	@ResponseBody
	public BoardRequestVO getScheBoardInfo(@RequestParam("prjBoardId") int prjBoardId) {
		BoardRequestVO vo = new BoardRequestVO();
		ScheVO scheVO = new ScheVO();
		scheVO.setPrjBoardId(prjBoardId);
		vo.setBoardVO(boardService.getScheBoardInfo(prjBoardId));
		vo.setScheVO(boardService.getScheInfo(scheVO));
		
		MemberVO memberVO = new MemberVO();
		String memberId = vo.getBoardVO().getMemberId();
		memberVO.setMemberId(memberId);
		memberVO = memberService.selectMember(memberVO);
		System.out.println(memberVO);
		vo.setMemberName(memberVO.getMemberName());
		vo.setRealProfilePath(memberVO.getRealProfilePath());
		return vo;
	}
	
	//프로젝트 업무 캘린더 상세조회
	@GetMapping("getTaskBoardInfo")
	@ResponseBody
	public Map<String, Object> getTaskBoardInfo(@RequestParam("prjBoardId") int prjBoardId) {
		//BoardRequestVO vo = new BoardRequestVO();
		Map<String, Object> resultMap = new HashMap<>();
	    
	    // 해당 게시글 번호
	    AllTaskBoardVO allTaskBoardVO = new AllTaskBoardVO();
	    allTaskBoardVO.setPrjBoardId(prjBoardId);

	    // 해당 업무 정보
	    List<AllTaskBoardVO> highTask = boardService.getTaskInfo(allTaskBoardVO);
	    // 업무 담당자 리스트
	    List<AllTaskBoardVO> highManager = boardService.getManager(allTaskBoardVO);

	    // 하위 업무
	    // 상위 업무의 업무번호
	    int taskId = boardService.getHighTaskId(allTaskBoardVO);
	    // 해당 업무의 하위 업무 리스트
	    List<AllTaskBoardVO> subTask = boardService.getSubTask(taskId);
	    // 각 하위 업무의 담당자 리스트
	    Map<Integer, List<AllTaskBoardVO>> subManager = new HashMap<>();

	    for (int i = 0; i < subTask.size(); i++) {
	        // 하위 업무 정보
	        AllTaskBoardVO subTaskInfo = subTask.get(i);
	        // 하위 업무의 게시글Id
	        int subTaskPrjBoardId = subTaskInfo.getPrjBoardId();
	        // 객체에 하위 업무의 게시글 Id 설정하기
	        allTaskBoardVO.setPrjBoardId(subTaskPrjBoardId);
	        // 하위 업무의 담당자 정보 조회
	        List<AllTaskBoardVO> subManagerInfo = boardService.getManager(allTaskBoardVO);
	        // 하위 업무 담당자 정보 추가
	        subManager.put(subTaskPrjBoardId, subManagerInfo);
	    }

	    resultMap.put("highTask", highTask);
	    resultMap.put("subTask", subTask);
	    resultMap.put("highManager", highManager);
	    resultMap.put("subManager", subManager);
	    

	    return resultMap;
	}
}
