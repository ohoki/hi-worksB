package com.worksb.hi.board.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.board.service.VoteVO;


@Controller
public class BoardController {
	//이진	
	@Autowired
	BoardService boardService;
	
	// 이진
	// 게시글 등록 폼
    @GetMapping("/boardInsert")
	public String BoardInsertForm(@RequestParam int projectId, HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("projectId", projectId);
		return "project/boardInsert";
	}
    
	//게시글 등록
	@PostMapping("/boardInsert")
	public String boardInsertProcess(BoardVO boardVO, TaskVO taskVO, VoteVO voteVO, HttpSession session) {
		
		String memberId = (String) session.getAttribute("memberId");
        boardVO.setMemberId(memberId);
		
        String boardType = boardVO.getBoardType();
        
        // 글 prj_project
		boardService.insertBoard(boardVO);
        
		int prjBoardId = boardVO.getPrjBoardId();
		
        if(boardType.equals("C8")) {
        	// 업무 prj_task
        	//board테이블의 id -> task테이블에도 넣기
        	taskVO.setPrjBoardId(prjBoardId);
        	
        	boardService.insertTask(taskVO);
        
        }else if(boardType.equals("C6")) {
        	// 일정
        	
        }else if(boardType.equals("C7")) {
        	// 투표
        	voteVO.setPrjBoardId(prjBoardId);
        	
        	boardService.insertVote(voteVO);
        	
        	String[] listContentArr = voteVO.getListContent().split(",");
        	
        	for(int i=0; i<listContentArr.length; i++) {
        		voteVO.setListContent(listContentArr[i]);
        		boardService.insertVoteList(voteVO);
        	}
        }
        
		return "redirect:/projectFeed?projectId=" + boardVO.getProjectId();
	}
}
