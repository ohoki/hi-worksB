package com.worksb.hi.boardCmt.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardCmtService {
	
    List<BoardCmtVO> getCommentsByBoardId(int boardId);
    
    List<BoardCmtVO> getRepliesByCommentId(int commentId);
    
    void addComment(BoardCmtVO comment);
    
    void addReply(BoardCmtVO reply);
    
    void updateComment(BoardCmtVO comment);
    
    void deleteComment(int commentId);
    
}
