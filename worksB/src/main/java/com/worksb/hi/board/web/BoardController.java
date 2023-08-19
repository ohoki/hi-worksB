package com.worksb.hi.board.web;

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

import com.worksb.hi.board.service.BoardRequestVO;
import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.ScheVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.board.service.VoteVO;
import com.worksb.hi.member.service.MemberVO;

// 이진 0818 게시판관리 - 게시글,업무,일정,투표 등록

@Controller
public class BoardController {
	//이진	
	@Autowired
	BoardService boardService;
	
	// 이진
	// 게시글 등록 폼
    @GetMapping("/boardInsert")
	public String BoardInsertForm(@RequestParam int projectId, HttpSession session, Model model) {
		model.addAttribute("projectId", projectId);
		return "project/boardInsert";
	}
    
    @PostMapping("taskInsert")
    @ResponseBody
    public String taskInsert(@RequestBody BoardRequestVO brVO) {
    	//게시글
    	BoardVO boardVO = brVO.getBoardVO();
    	boardService.insertBoard(brVO.getBoardVO());
    	//상위업무
    	TaskVO taskVO = brVO.getTaskVO();
    	taskVO.setPrjBoardId(boardVO.getPrjBoardId());
    	boardService.insertTask(taskVO);
    	
    	//하위업무
    	List<TaskVO> taskList = brVO.getSubTask();
    	if(taskList != null){
    		TaskVO subtaskVO ;
	    	for(int i=0;i<taskList.size(); i++) {
	    		BoardVO subBoardVO = new BoardVO();
	    		subtaskVO =taskList.get(i);
	    		subBoardVO.setPrjBoardTitle(subtaskVO.getPrjBoardTitle());
	    		subBoardVO.setMemberId(boardVO.getMemberId());
	    		subBoardVO.setProjectId(boardVO.getProjectId());
	    		subBoardVO.setBoardType(boardVO.getBoardType());
	    		subBoardVO.setInspYn("E2");
	    		boardService.insertBoard(subBoardVO);
	    		subtaskVO.setPrjBoardId(subBoardVO.getPrjBoardId());
	    		subtaskVO.setHighTaskId(taskVO.getTaskId());
	    		subtaskVO.setState(taskVO.getState());
	    		boardService.insertTask(subtaskVO);
	    	}
    	}
    	return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
    }
    
	//게시글 등록  --ajax
	@PostMapping("/boardInsert")
	public String boardInsertProcess(BoardVO boardVO, TaskVO taskVO, VoteVO voteVO, ScheVO scheVO, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		String memberId = member.getMemberId();
		
        boardVO.setMemberId(memberId);
		
        String boardType = boardVO.getBoardType();
        
        // 글 prj_project
		boardService.insertBoard(boardVO);
        
		int prjBoardId = boardVO.getPrjBoardId();
		
        if(boardType.equals("C6")) {
        	// 일정
        	scheVO.setPrjBoardId(prjBoardId);
        	
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
}
